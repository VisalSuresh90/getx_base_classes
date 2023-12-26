import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_classes/getx_base_classes.dart';

import '../controller/home_controller.dart';

class HomeBinding extends BaseBinding {
  const HomeBinding();
  @override
  void injectDependencies() {
    debugPrint('HomeBinding : injectDependencies ');
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}
