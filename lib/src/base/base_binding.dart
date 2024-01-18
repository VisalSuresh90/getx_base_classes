import 'package:get/get.dart';

/// An abstract class that serves as the base for defining Bindings in GetX.
///
/// Extend this class to create custom Bindings for your screens or controllers.
abstract class BaseBinding implements Bindings {
  /// Constructs a [BaseBinding].
  const BaseBinding();

  /// Overrides the [dependencies] method from [Bindings] to call [injectDependencies].
  @override
  void dependencies() {
    injectDependencies();
  }

  /// Abstract method to be implemented by subclasses for injecting dependencies.
  ///
  /// This method should be overridden in concrete bindings to provide the necessary dependencies
  /// for the associated screen or controller.
  void injectDependencies();
}
