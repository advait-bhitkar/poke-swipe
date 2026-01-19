enum AppFlavor { dev, staging, prod }

extension AppFlavorExtension on AppFlavor {
  String get name => toString().split('.').last;

  static AppFlavor fromString(String value) {
    switch (value) {
      case 'prod':
        return AppFlavor.prod;
      case 'staging':
        return AppFlavor.staging;
      case 'dev':
      default:
        return AppFlavor.dev;
    }
  }
}
