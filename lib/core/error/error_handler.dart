import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../logging/app_logger.dart';
import 'app_error.dart';

/// Normalizes DioException into a unified AppError model.
AppError normalizeDioError(DioException error) => AppError(
    message: error.message ?? 'Unknown error',
    code: error.response?.statusCode?.toString() ?? '',
    details: error.response?.data,
  );

/// Shows an [AppError] in the UI using a dialog.
void showAppError(BuildContext context, AppError error) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('An error occurred'),
      content: Text(error.message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

/// Sets up global error handling for Flutter and Dart errors.
///
/// [flavor] is the current app flavor (e.g., 'dev', 'prod').
void setupGlobalErrorHandling({
  required String flavor,
}) {
  final logger = GetIt.I<AppLogger>();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    // Log error using AppLogger
    logger.e('FlutterError: ${details.exceptionAsString()}', error: details.exception, stackTrace: details.stack);
    if (flavor == 'prod') {
      // Send to Crashlytics/Sentry
    }
  };
}
