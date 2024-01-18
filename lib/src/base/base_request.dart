/// A base class representing a request with common properties.
class BaseRequest {
  /// The device ID associated with the request.
  String deviceId;

  /// The token ID associated with the request.
  String tokenId;

  /// Constructs a [BaseRequest] with optional [deviceId] and [tokenId] parameters.
  ///
  /// [deviceId]: The device ID associated with the request (default is an empty string).
  /// [tokenId]: The token ID associated with the request (default is an empty string).
  BaseRequest({this.deviceId = '', this.tokenId = ''});
}
