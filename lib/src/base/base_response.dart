/// A generic class representing a response with common properties.
class BaseResponse<T> {
  /// A boolean indicating the success status of the response.
  bool success;

  /// An optional message associated with the response.
  String? message;

  /// Generic data associated with the response.
  T? data;

  /// Constructs a [BaseResponse] with required [success] status and optional [message] and [data].
  ///
  /// [success]: The success status of the response.
  /// [message]: An optional message associated with the response.
  /// [data]: Generic data associated with the response.
  BaseResponse({required this.success, this.message, this.data});

  /// Factory constructor for creating a [BaseResponse] from a JSON map.
  ///
  /// [json]: The JSON map representing the response.
  /// [fromJsonT]: A function to convert the 'data' field in the JSON map to a typed object.
  factory BaseResponse.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return BaseResponse(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }
}
