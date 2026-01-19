import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../config/app_config.dart';
import '../error/error_handler.dart';
import '../logging/app_logger.dart';
import 'api_response.dart';
import '../error/app_error.dart';

/// Provides a base Dio client with auth, retry, logging, timeout, and cancellation support.
class DioClient {

  DioClient({String? baseUrl, Duration? timeout, String? Function()? getAuthToken})
      : _logger = GetIt.I<AppLogger>(),
        _config = GetIt.I<AppConfig>(),
        dio = Dio(BaseOptions(
          baseUrl: baseUrl ?? GetIt.I<AppConfig>().apiBaseUrl,
          connectTimeout: timeout ?? const Duration(seconds: 10),
          receiveTimeout: timeout ?? const Duration(seconds: 10),
          // sendTimeout: timeout ?? const Duration(seconds: 10),
        )) {
    // Auth Interceptor
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = getAuthToken?.call();
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
    ));

    // Retry Interceptor (simple, can be replaced with dio_retry package)
    dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) async {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.sendTimeout) {
          // Retry once for timeout errors
          try {
            final response = await dio.fetch(e.requestOptions);
            return handler.resolve(response);
          } catch (err) {
            return handler.next(e);
          }
        }
        return handler.next(e);
      },
    ));

    // Logging Interceptor (env-based)
    if (_config.isDev) {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => _logger.d(obj.toString()),
      ));
    } else {
      dio.interceptors.add(LogInterceptor(
        request: false,
        requestHeader: false,
        responseHeader: false,
        logPrint: (obj) => _logger.d(obj.toString()),
      ));
    }
  }

  final Dio dio;
  final AppLogger _logger;
  final AppConfig _config;

  /// Returns a new CancelToken for request cancellation.
  CancelToken getCancelToken() => CancelToken();
}
