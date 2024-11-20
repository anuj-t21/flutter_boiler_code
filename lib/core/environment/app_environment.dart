import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'app_environment_keys.dart';

/// Manages the application environment configurations.
class AppEnvironment {
  /// Default environment configuration file.
  static const _defaultEnvFile = 'env/dotdev.env';

  /// Development environment configuration file.
  static const _developmentEnvFile = 'env/dotdev.env';

  /// Production environment configuration file.
  static const _productionEnvFile = 'env/dotprod.env';

  /// Local environment configuration file.
  static const _localEnvFile = 'env/dotlocal.env';

  /// Cached environment keys and values.
  static _AppEnvironmentKeys? _config;

  /// Environment data loaded from the configuration files.
  static late Map<String, String> _envData;

  /// Initializes the environment by loading the appropriate configuration files.
  static Future<void> initialize() async {
    final Map<String, String> defaultConfig;
    Map<String, String> finalConfig;

    try {
      defaultConfig = await _loadDefaultConfig();
    } on Error catch (error) {
      log('[AppEnvironment]:[initialize]:[_loadDefaultConfig]: ${error.runtimeType} error loading $_defaultEnvFile. '
          'Are you sure '
          '$_defaultEnvFile '
          'is present in '
          'the project directory and listed under assets in pubspec.yaml?');
      rethrow;
    }

    try {
      late Map<String, String> config;

      /// Loads configuration based on the build mode (release or debug).
      if (kReleaseMode) {
        config = await _loadConfig(_productionEnvFile, defaultConfig);
      } else {
        config = await _loadConfig(_developmentEnvFile, defaultConfig);
      }

      /// Loads the local configuration overriding the 'SYSTEM_IP' key.
      config['SYSTEM_IP'] =
          (await _loadConfig(_localEnvFile, defaultConfig))['SYSTEM_IP']
              as String;

      finalConfig = config;
    } on Error catch (error) {
      finalConfig = defaultConfig;
      log('[AppEnvironment]:[initialize]:[_loadConfig(_,_)]: ${error.runtimeType} error loading config file. Using '
          '$_defaultEnvFile as '
          'fallback.');
    }

    _envData = finalConfig;
  }

  /// Loads the default configuration from the specified file.
  static Future<Map<String, String>> _loadDefaultConfig() async {
    final defaultConfig = <String, String>{};

    await dotenv.load(fileName: _defaultEnvFile);
    defaultConfig.addAll(dotenv.env);

    return defaultConfig;
  }

  /// Loads configuration from a specified file, merging it with the default configuration.
  static Future<Map<String, String>> _loadConfig(
      String filename, Map<String, String> defaultConfig) async {
    final config = <String, String>{};

    await dotenv.load(fileName: filename);
    config.addAll(dotenv.env);

    for (final key in defaultConfig.keys) {
      config.putIfAbsent(key, () => defaultConfig[key]!);
    }

    return config;
  }

  /// Returns the current environment configuration, initializing it if necessary.
  static _AppEnvironmentKeys get config {
    if (_config == null) {
      AppEnvironment._internal();
    }

    return _config!;
  }

  /// Internal constructor to initialize the environment keys.
  AppEnvironment._internal() {
    _config = _AppEnvironmentKeys(_envData);
  }
}
