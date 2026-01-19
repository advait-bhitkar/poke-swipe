import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkUtil {
  static final Connectivity _connectivity = Connectivity();

  /// Checks if the device is connected to the internet (WiFi or Mobile).
  static Future<bool> checkInternetConnection() async {
    final result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  /// Checks if the device is connected via WiFi.
  static Future<bool> isConnectedViaWifi() async {
    final result = await _connectivity.checkConnectivity();
    return result == ConnectivityResult.wifi;
  }

  /// Checks if the device is connected via Mobile Data.
  static Future<bool> isConnectedViaMobile() async {
    final result = await _connectivity.checkConnectivity();
    return result == ConnectivityResult.mobile;
  }

  /// Returns the current connection type as a string: 'wifi', 'mobile', or 'none'.
  static Future<String> getConnectionType() async {
    final result = await _connectivity.checkConnectivity();
    switch (result) {
      case ConnectivityResult.wifi:
        return 'wifi';
      case ConnectivityResult.mobile:
        return 'mobile';
      default:
        return 'none';
    }
  }

  /// Stream to listen for connectivity changes.
  static Stream<ConnectivityResult> get onConnectionChanged => _connectivity.onConnectivityChanged;
}

