import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'core/config/app_config.dart';
import 'core/theme/theme.dart';
import 'core/router/router.dart';
import 'package:dynamic_color/dynamic_color.dart';

final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(ThemeMode.dark);
final ValueNotifier<bool> fontScalingEnabledNotifier = ValueNotifier(true);
final ValueNotifier<double> fontScaleNotifier = ValueNotifier(1.0);
final ValueNotifier<bool> dynamicColorEnabledNotifier = ValueNotifier(true);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GoRouter _router = createRouter(
    onPageView: (routeName) {
      // Example analytics logic
      print('Navigated to: $routeName');
    },
  );

  @override
  Widget build(BuildContext context) {
    final config = GetIt.I<AppConfig>();
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) => ValueListenableBuilder<bool>(
          valueListenable: dynamicColorEnabledNotifier,
          builder: (context, dynamicColorEnabled, _) => ValueListenableBuilder<ThemeMode>(
              valueListenable: themeModeNotifier,
              builder: (context, mode, _) => ValueListenableBuilder<bool>(
                  valueListenable: fontScalingEnabledNotifier,
                  builder: (context, fontScalingEnabled, _) => ValueListenableBuilder<double>(
                      valueListenable: fontScaleNotifier,
                      builder: (context, fontScale, _) => MaterialApp.router(
                            title: config.appName,
                            theme: buildTheme(
                              context: context,
                              isDark: false,
                              enableFontScaling: fontScalingEnabled,
                              fontScale: fontScalingEnabled ? fontScale : 1.0,
                              dynamicColorScheme: dynamicColorEnabled ? lightDynamic : null,
                            ),
                            darkTheme: buildTheme(
                              context: context,
                              isDark: true,
                              enableFontScaling: fontScalingEnabled,
                              fontScale: fontScalingEnabled ? fontScale : 1.0,
                              dynamicColorScheme: dynamicColorEnabled ? darkDynamic : null,
                            ),
                            themeMode: mode,
                            routerConfig: _router,
                          ),
                        ),
                    ),
                ),
            ),
        );
  }
}
