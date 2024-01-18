// ignore_for_file: constant_identifier_names

/// Enumeration representing different environments: Development (DEV), User Acceptance Testing (UAT), and Production (PROD).
enum Environment { DEV, UAT, PROD }

/// Singleton class for managing the base application environment configuration.
class BaseAppEnv {
  /// Map containing the configuration constants for the current environment.
  static late Map<String, dynamic> _config;

  /// Sets the environment configuration based on the provided environment [env] and [config].
  void setEnvironment(Environment env, ConfigConstants config) {
    _config = config.getConstants(env);
  }

  /// Gets the configuration constant for 'SERVER_ONE'.
  static get serverOne {
    return _config[ConfigConstants.SERVER_ONE];
  }

  /// Gets the configuration constant for 'SERVER_TWO'.
  static get serverTwo {
    return _config[ConfigConstants.SERVER_TWO];
  }

  /// Gets the configuration constant for 'STAGE'.
  static get stage {
    return _config[ConfigConstants.STAGE];
  }
}

/// Constants class containing keys for different configuration values.
class ConfigConstants {
  /// Key for the 'SERVER_ONE' configuration constant.
  static const String SERVER_ONE = "SERVER_ONE";

  /// Key for the 'SERVER_TWO' configuration constant.
  static const String SERVER_TWO = "SERVER_TWO";

  /// Key for the 'STAGE' configuration constant.
  static const String STAGE = "STAGE";

  /// Map containing configuration constants for different environments.
  final Map<String, dynamic> debugConfig;
  final Map<String, dynamic> uatConfig;
  final Map<String, dynamic> prodConfig;

  /// Constructor for [ConfigConstants] class, requires configuration constants for each environment.
  ConfigConstants({
    required this.debugConfig,
    required this.uatConfig,
    required this.prodConfig,
  });

  /// Gets the configuration constants based on the provided environment [env].
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
