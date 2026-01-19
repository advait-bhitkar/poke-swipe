/// Abstract logger interface for the app.
abstract class AppLogger {
  void d(String message, {Object? error, StackTrace? stackTrace});
  void i(String message, {Object? error, StackTrace? stackTrace});
  void w(String message, {Object? error, StackTrace? stackTrace});
  void e(String message, {Object? error, StackTrace? stackTrace});
}
