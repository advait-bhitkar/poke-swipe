import 'package:package_info_plus/package_info_plus.dart';

class AppInfoUtil {
  static Future<String> getAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    return info.version;
  }

  static Future<String> getBuildNumber() async {
    final info = await PackageInfo.fromPlatform();
    return info.buildNumber;
  }

  static Future<String> getAppName() async {
    final info = await PackageInfo.fromPlatform();
    return info.appName;
  }

  static Future<String> getPackageName() async {
    final info = await PackageInfo.fromPlatform();
    return info.packageName;
  }

  static Future<Map<String, String>> getFullInfo() async {
    final info = await PackageInfo.fromPlatform();
    return {
      'appName': info.appName,
      'packageName': info.packageName,
      'version': info.version,
      'buildNumber': info.buildNumber,
    };
  }

  static Future<String> getVersionWithBuild() async {
    final info = await PackageInfo.fromPlatform();
    return 'v${info.version} (${info.buildNumber})';
  }
}
