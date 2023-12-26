// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:getx_base_classes/getx_base_classes.dart';

class BaseConnect extends GetConnect {
  final Map<String, String> header;
  final String appBaseUrl;
  final String? authenticatorUrl;
  static const TAG = 'BaseConnect';

  BaseConnect(
      {Map<String, String>? header, String? baseUrl, this.authenticatorUrl})
      : header = header ?? {'Content-Type': 'application/json'},
        appBaseUrl = baseUrl ?? BaseAppEnv.serverOne {
    onInit();
  }

  @override
  void onInit() {
    // Set the base URL for all requests
    httpClient.baseUrl = appBaseUrl;

    // Add custom headers if needed
    httpClient.addRequestModifier((Request<dynamic> request) {
      request.headers.addAll(header);
      debugPrint('http Request: ${request.method} ${request.url}');
      debugPrint('http Headers: ${request.headers}');
      debugPrint('http Request Body: ${request.bodyBytes}');
      return request;
    });

    // Add authenticator if provided
    if (authenticatorUrl != null) {
      httpClient.addAuthenticator((Request<dynamic> request) async {
        // final response = await get("http://yourapi/token");
        final response = await get(authenticatorUrl!);
        final token = response.body['token'];
        // Set the header
        request.headers['Authorization'] = "$token";
        return request;
      });
    }
    //Autenticator will be called 3 times if HttpStatus is
    //HttpStatus.unauthorized
    httpClient.maxAuthRetries = 3;
    super.onInit();
  }

  Future<BaseResponse<T>> requestWithResponse<T>(
    String path, {
    required T Function(Map<String, dynamic>) fromJsonT,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    bool isPost = false,
    bool isPut = false,
    bool isDelete = false,
    Function(dynamic response)? handleErrorStatus,
  }) async {
    Response response;
    debugPrint('http Request: ${httpClient.baseUrl}');
    try {
      if (isPost) {
        response = await post(path, data);
      } else if (isPut) {
        response = await put(path, data);
      } else if (isDelete) {
        response = await delete(path);
      } else {
        response = await get(path, query: query);
      }

      debugPrint('http Response: ${response.statusCode}');
      debugPrint('http Response Body: ${response.body}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.body;
        // return BaseResponse.fromJson(jsonResponse, fromJsonT);
        bool success = jsonResponse['success'];
        String? message = jsonResponse['message'];
        T? data = success ? fromJsonT(jsonResponse['data']) : null;

        return BaseResponse<T>(
          success: success,
          message: message ?? '', // Use an empty string if message is null
          data: data,
        );
      } else {
        if (handleErrorStatus != null) {
          handleErrorStatus(response);
        } else {
          // Show a dialog with the error message
          Get.defaultDialog(
            title: 'Error',
            middleText: 'Failed to make request: ${response.statusCode}',
            confirm: ElevatedButton(
              onPressed: () {
                Get.back(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          );
        }
        throw Exception('Failed to make request: ${response.statusCode}');
      }
    } catch (e) {
      // Handle other exceptions
      debugPrint('Exception during request: $e');
      rethrow; // Rethrow the exception to propagate it to the calling code
    }
  }

  Future<Response> getAsync(String endpoint) async {
    return await get(endpoint);
  }

  Future<Response> postAsync(String endpoint, dynamic data) async {
    return await post(endpoint, data);
  }

  Future<Response> putAsync(String endpoint, dynamic data) async {
    return await put(endpoint, data);
  }

  Future<Response> deleteAsync(String endpoint) async {
    return await delete(endpoint);
  }
}
