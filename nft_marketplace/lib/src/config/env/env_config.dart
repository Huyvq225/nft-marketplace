import 'package:package_info_plus/package_info_plus.dart';

enum Flavor { dev, uat, prod }

class EnvConfig {
  static final EnvConfig _instance = EnvConfig._internal();
  static late PackageInfo _packageInfo;

  factory EnvConfig() {
    return _instance;
  }

  EnvConfig._internal();

  static Future<void> getInfo() async {
    _packageInfo = await PackageInfo.fromPlatform();
    return;
  }

  static Flavor get appFlavor {
    switch (_packageInfo.packageName) {
      case 'com.example.nft_marketplace':
        return Flavor.prod;
      case 'com.example.nft_marketplace.uat':
        return Flavor.uat;
      case 'com.example.nft_marketplace.dev':
        return Flavor.dev;
      default:
        throw 'Cannot get app flavor';
    }
  }

  static String get packageName => _packageInfo.packageName;

  static String get appName => _packageInfo.appName;

  static String get appVersion => _packageInfo.version;

  static String get appBuildNumber => _packageInfo.buildNumber;
}
