import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  AppConfig({
    required this.apiBaseUrl,
    required this.appName,
    required this.bundleId,
    required this.flavor,
  });

  factory AppConfig.fromEnv(String flavor) => AppConfig(
      apiBaseUrl: dotenv.env['API_BASE_URL'] ?? '',
      appName: dotenv.env['APP_NAME'] ?? 'FlutterX',
      bundleId: dotenv.env['BUNDLE_ID'] ?? '',
      flavor: flavor,
    );

  final String apiBaseUrl;
  final String appName;
  final String bundleId;
  final String flavor;

  bool get isDev => flavor == 'dev';
  bool get isStaging => flavor == 'staging';
  bool get isProd => flavor == 'prod';
}
