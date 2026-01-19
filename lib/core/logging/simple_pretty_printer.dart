import 'package:logger/logger.dart';

/// ANSI color codes for terminal output
class AnsiColor {
  static const reset = '\x1B[0m';
  static const red = '\x1B[31m';
  static const green = '\x1B[32m';
  static const yellow = '\x1B[33m';
  static const blue = '\x1B[34m';
  static const magenta = '\x1B[35m';
  static const cyan = '\x1B[36m';
  static const white = '\x1B[37m';
  static const grey = '\x1B[90m';
}

/// A simple pretty printer for clean, readable, colored log output.
class SimplePrettyPrinter extends LogPrinter {
  String _colorForLevel(Level level) {
    // Only handle supported log levels for our logger. Deprecated levels (verbose, wtf) are not used.
    switch (level) {
      case Level.debug:
        return AnsiColor.green;
      case Level.info:
        return AnsiColor.blue;
      case Level.warning:
        return AnsiColor.yellow;
      case Level.error:
        return AnsiColor.red;
      default:
        return AnsiColor.white;
    }
  }

  @override
  List<String> log(LogEvent event) {
    final time = DateTime.now().toIso8601String();
    final level = event.level.toString().split('.').last.toUpperCase();
    final color = _colorForLevel(event.level);
    final message = event.message;
    final error = event.error != null ? ' | ${AnsiColor.red}ERROR: ${event.error}${AnsiColor.reset}' : '';
    final stack = event.stackTrace != null ? '\n${AnsiColor.magenta}STACK: ${event.stackTrace}${AnsiColor.reset}' : '';
    return [
      '${AnsiColor.grey}[$time]${AnsiColor.reset}'
      '[$color$level${AnsiColor.reset}] '
      '$color$message${AnsiColor.reset}'
      '$error'
      '$stack'
    ];
  }
}
