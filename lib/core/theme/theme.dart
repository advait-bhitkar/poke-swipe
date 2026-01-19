import 'package:flutter/material.dart';
import 'colors.dart';
import 'text_styles.dart';

ThemeData buildTheme({
  required BuildContext context,
  bool isDark = false,
  bool enableFontScaling = true,
  double? fontScale,
  ColorScheme? dynamicColorScheme,
}) {
  final colorScheme = dynamicColorScheme != null
      ? dynamicColorScheme.copyWith(brightness: isDark ? Brightness.dark : Brightness.light)
      : (isDark
          ? const ColorScheme(
              brightness: Brightness.dark,
              primary: AppColors.darkPrimary,
              onPrimary: AppColors.darkSurface,
              secondary: AppColors.darkSecondary,
              onSecondary: AppColors.darkSurface,
              error: AppColors.darkError,
              onError: AppColors.darkSurface,
              surface: AppColors.darkSurface,
              onSurface: AppColors.darkTextPrimary,
            )
          : const ColorScheme(
              brightness: Brightness.light,
              primary: AppColors.lightPrimary,
              onPrimary: AppColors.lightSurface,
              secondary: AppColors.lightSecondary,
              onSecondary: AppColors.lightSurface,
              error: AppColors.lightError,
              onError: AppColors.lightSurface,
              surface: AppColors.lightSurface,
              onSurface: AppColors.lightTextPrimary,
            ));
  return ThemeData(
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colorScheme.surface,
    useMaterial3: true,
    textTheme: AppTextStyles.textTheme(
      context,
      enableFontScaling: enableFontScaling,
      fontScale: fontScale,
    ),
  );
}

final ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.lightPrimary,
    onPrimary: AppColors.lightSurface,
    secondary: AppColors.lightSecondary,
    onSecondary: AppColors.lightSurface,
    error: AppColors.lightError,
    onError: AppColors.lightSurface,
    surface: AppColors.lightSurface,
    onSurface: AppColors.lightTextPrimary,
  ),
  scaffoldBackgroundColor: AppColors.lightSurface,
  useMaterial3: true,
);

final ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.darkPrimary,
    onPrimary: AppColors.darkSurface,
    secondary: AppColors.darkSecondary,
    onSecondary: AppColors.darkSurface,
    error: AppColors.darkError,
    onError: AppColors.darkSurface,
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkTextPrimary,
  ),
  scaffoldBackgroundColor: AppColors.darkSurface,
  useMaterial3: true,
);
