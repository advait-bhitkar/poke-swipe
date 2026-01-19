import 'package:logger/logger.dart';
import 'app_logger.dart';
import 'simple_pretty_printer.dart';

/// Concrete implementation of [AppLogger] using the logger package.
class LoggerAppLogger implements AppLogger {

  /// Creates a [LoggerAppLogger].
  ///
  /// You can provide a custom [Logger] instance for advanced configuration or testing.
  LoggerAppLogger({Logger? logger})
      : _logger = logger ?? Logger(printer: SimplePrettyPrinter());
  /// The underlying logger instance. Can be customized for testing or advanced use.

  final Logger _logger;

  /// Logs a debug message.
  @override
  void d(String message, {Object? error, StackTrace? stackTrace}) =>
      _logger.d(message, error: error, stackTrace: stackTrace);

  /// Logs an info message.
  @override
  void i(String message, {Object? error, StackTrace? stackTrace}) =>
      _logger.i(message, error: error, stackTrace: stackTrace);

  /// Logs a warning message.
  @override
  void w(String message, {Object? error, StackTrace? stackTrace}) =>
      _logger.w(message, error: error, stackTrace: stackTrace);

  /// Logs an error message.
  @override
  void e(String message, {Object? error, StackTrace? stackTrace}) =>
      _logger.e(message, error: error, stackTrace: stackTrace);

  /// Logs a JSON or Map object as a pretty-printed string (optional convenience).
  void logJson(Object json, {String? label}) {
    final msg = label != null ? '\n$label: $json' : '\n$json';
    _logger.i(msg);
  }
}
