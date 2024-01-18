// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:getx_base_classes/getx_base_classes.dart';

/// A base class for managing HTTP requests and connections using GetX.
class BaseConnect extends GetConnect {
  /// Headers to be included in each HTTP request.
  final Map<String, String> header;

  /// Base URL for the application.
  final String appBaseUrl;

  /// Optional URL for authentication purposes.
  final String? authenticatorUrl;

  /// A constant representing the class tag for debugging and logging purposes.
  static const TAG = 'BaseConnect';

  /// Constructor for [BaseConnect].
  ///
  /// [header]: Headers to be included in each HTTP request.
  /// [baseUrl]: Base URL for the application.
  /// [authenticatorUrl]: Optional URL for authentication purposes.
  BaseConnect({
    Map<String, String>? header,
    String? baseUrl,
    this.authenticatorUrl,
  })  : header = header ?? {'Content-Type': 'application/json'},
        appBaseUrl = baseUrl ?? BaseAppEnv.serverOne {
    onInit();
  }

  /// Initializes the [BaseConnect] instance by setting the base URL, headers, and authenticator.
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
        final response = await get(authenticatorUrl!);
        final token = response.body['token'];
        // Set the header
        request.headers['Authorization'] = "$token";
        return request;
      });
    }

    // Authenticator will be called 3 times if HttpStatus is
    // HttpStatus.unauthorized
    httpClient.maxAuthRetries = 3;

    super.onInit();
  }

  /// Performs an HTTP request and returns a [BaseResponse] containing the result.
  ///
  /// [path]: The path of the endpoint.
  /// [fromJsonT]: A function to convert the JSON response to a typed object.
  /// [data]: Optional data to be sent with the request.
  /// [query]: Optional query parameters.
  /// [isPost]: Indicates if it's a POST request.
  /// [isPut]: Indicates if it's a PUT request.
  /// [isDelete]: Indicates if it's a DELETE request.
  /// [handleErrorStatus]: A function to handle error statuses.
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

  /// Asynchronously performs a GET request to the specified [endpoint].
  Future<Response> getAsync(String endpoint) async {
    return await get(endpoint);
  }

  /// Asynchronously performs a POST request to the specified [endpoint] with the provided [data].
  Future<Response> postAsync(String endpoint, dynamic data) async {
    return await post(endpoint, data);
  }

  /// Asynchronously performs a PUT request to the specified [endpoint] with the provided [data].
  Future<Response> putAsync(String endpoint, dynamic data) async {
    return await put(endpoint, data);
  }

  /// Asynchronously performs a DELETE request to the specified [endpoint].
  Future<Response> deleteAsync(String endpoint) async {
    return await delete(endpoint);
  }
}
