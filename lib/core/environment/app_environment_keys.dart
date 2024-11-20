part of 'app_environment.dart';

class _AppEnvironmentKeys {
  final Map<String, String> _envConfig;

  _AppEnvironmentKeys(this._envConfig);

  // / Either `production` or `development`
  String get environment => _envConfig['ENVIRONMENT']!;

  String get apiUrl => _envConfig['API_URL']!;

  String get deepLinkUriPrefix => _envConfig['DEEP_LINK_URI_PREFIX']!;

  String get androidPackageName => _envConfig['ANDROID_PACKAGE_NAME']!;

  String get iosBundleId => _envConfig['IOS_BUNDLE_ID']!;

  String get iosAppStoreId => _envConfig['IOS_APPSTORE_ID']!;

  String get systemIP => _envConfig['SYSTEM_IP']!;

  String get geminiApiKey => _envConfig['GEMINI_API_KEY']!;

  _SupabaseEnvironmentKeys get supabase => _SupabaseEnvironmentKeys(_envConfig);
}

class _SupabaseEnvironmentKeys {
  final Map<String, String> _envConfig;

  _SupabaseEnvironmentKeys(this._envConfig);

  String get url => _envConfig['SUPABASE_URL']!;

  String get anonKey => _envConfig['S_ANON_KEY']!;
}
