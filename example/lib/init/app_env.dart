import 'package:flutter/material.dart';
import 'package:getx_base_classes/getx_base_classes.dart';

class AppEnviornment {
  static Map<String, dynamic> debugConstants = {
    ConfigConstants.SERVER_ONE:
        "https://portfolio-visal.s3.eu-west-2.amazonaws.com",
    ConfigConstants.SERVER_TWO:
        "https://portfolio-visal.s3.eu-west-2.amazonaws.com",
    ConfigConstants.STAGE: "local",
  };

  static Map<String, dynamic> uatConstants = {
    ConfigConstants.SERVER_ONE: "https://staging1.example.com/",
    ConfigConstants.SERVER_TWO: "https://staging2.example.com/",
    ConfigConstants.STAGE: "uat",
  };

  static Map<String, dynamic> prodConstants = {
    ConfigConstants.SERVER_ONE: "https://itsallwidgets.com/",
    ConfigConstants.SERVER_TWO: "https://flutter.io/",
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
