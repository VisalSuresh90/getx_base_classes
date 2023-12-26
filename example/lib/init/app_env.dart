import 'package:flutter/material.dart';
import 'package:getx_base_classes/getx_base_classes.dart';

class AppEnviornment {
  static Map<String, dynamic> debugConstants = {
    ConfigConstants.SERVER_ONE: "https://your-debug-ser1.com",
    ConfigConstants.SERVER_TWO: "https://your-debug-ser2.com",
    ConfigConstants.STAGE: "local",
  };

  static Map<String, dynamic> uatConstants = {
    ConfigConstants.SERVER_ONE: "https://your-uat-ser1.com",
    ConfigConstants.SERVER_TWO: "https://your-uat-ser2.com",
    ConfigConstants.STAGE: "uat",
  };

  static Map<String, dynamic> prodConstants = {
    ConfigConstants.SERVER_ONE: "https://your-prod-ser1.com",
    ConfigConstants.SERVER_TWO: "https://your-prod-ser2.com",
    ConfigConstants.STAGE: "prod"
  };

  static void init() {
    ConfigConstants configConstants = ConfigConstants(
      debugConfig: debugConstants,
      uatConfig: uatConstants,
      prodConfig: prodConstants,
    );
    BaseAppEnv().setEnvironment(Environment.DEV, configConstants);
    debugPrint('Base Url: ${BaseAppEnv.serverOne}');
  }
}
