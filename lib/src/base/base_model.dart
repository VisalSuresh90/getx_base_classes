/// An abstract class defining the contract for model classes in the application.
///
/// Extend this class to create custom models for different data entities.
abstract class BaseModel<T> {
  /// Deserializes the provided [json] map into an instance of the model.
  ///
  /// This method should be implemented by concrete model classes to convert JSON data
  /// into a strongly-typed model object.
  T fromJson(Map<String, dynamic> json);

  /// Serializes the model instance into a [Map] of key-value pairs.
  ///
  /// This method should be implemented by concrete model classes to convert the model
  ///
}
