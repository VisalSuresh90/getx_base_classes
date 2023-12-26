// ignore_for_file: constant_identifier_names

enum Environment { DEV, UAT, PROD }

class BaseAppEnv {
  static late Map<String, dynamic> _config;

  void setEnvironment(Environment env, ConfigConstants config) {
    _config = config.getConstants(env);
  }

  static get serverOne {
    return _config[ConfigConstants.SERVER_ONE];
  }

  static get serverTwo {
    return _config[ConfigConstants.SERVER_TWO];
  }

  static get stage {
    return _config[ConfigConstants.STAGE];
  }
}

class ConfigConstants {
  static const String SERVER_ONE = "SERVER_ONE";
  static const String SERVER_TWO = "SERVER_TWO";
  static const String STAGE = "STAGE";

  final Map<String, dynamic> debugConfig;
  final Map<String, dynamic> uatConfig;
  final Map<String, dynamic> prodConfig;

  ConfigConstants({
    required this.debugConfig,
    required this.uatConfig,
    required this.prodConfig,
  });

  Map<String, dynamic> getConstants(Environment env) {
    switch (env) {
      case Environment.DEV:
        return debugConfig;
      case Environment.UAT:
        return uatConfig;
      case Environment.PROD:
        return prodConfig;
    }
  }
}
