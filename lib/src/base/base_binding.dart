import 'package:get/get.dart';

abstract class BaseBinding implements Bindings {
  const BaseBinding();

  @override
  void dependencies() {
    injectDependencies();
  }

  void injectDependencies();
}
