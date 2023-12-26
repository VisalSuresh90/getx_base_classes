class BaseResponse<T> {
  bool success;
  String? message;
  T? data;

  BaseResponse({required this.success, this.message, this.data});

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return BaseResponse(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }
}
