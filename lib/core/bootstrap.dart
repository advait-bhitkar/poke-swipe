import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import '../features/poke_swipe/di/di.dart';
import 'config/app_config.dart';
import 'config/app_flavor.dart';
import 'error/error_handler.dart';
import 'logging/app_logger.dart';
import 'logging/logger_app_logger.dart';
import 'dart:async';
import 'network/dio_client.dart';
import '../features/poke_swipe/domain/entity/pokemon_entity.dart';

/// Bootstraps the Flutter application with environment, DI, Crashlytics, logger, and error handling.
///
/// [appMain] is the app entry point callback (e.g., () => runApp(MyApp())).
Future<void> bootstrap(FutureOr<void> Function() appMain) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Detect flavor from environment
  const flavorString = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
  final flavor = AppFlavorExtension.fromString(flavorString);

  // Load environment variables
  await dotenv.load(fileName: '.env.${flavor.name}');

  // Initialize DI
  GetIt.I.registerSingleton<AppConfig>(AppConfig.fromEnv(flavor.name));
  GetIt.I.registerSingleton<AppLogger>(LoggerAppLogger());

  // Register DioClient in DI
  GetIt.I.registerSingleton<DioClient>(DioClient());

  setupPokeSwipeDI();

  // Log environment
  final logger = GetIt.I<AppLogger>();
  final config = GetIt.I<AppConfig>();
  logger.i('App started with flavor: ${flavor.name}');
  logger.i('API Base URL: ${config.apiBaseUrl}');

  // Set up global error handling (FlutterError.onError)
  setupGlobalErrorHandling(
    flavor: flavor.name,
  );

  // Call appMain (runApp) in the root zone to avoid zone mismatch
  await appMain();
}
