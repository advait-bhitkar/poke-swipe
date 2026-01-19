import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  /// Returns a TextTheme with font sizes scaled by the current textScaleFactor or a custom scale.
  ///
  /// [enableFontScaling]: If false, disables scaling (fontScale = 1.0).
  /// [fontScale]: If provided, uses this value instead of MediaQuery.textScaleFactor.
  static TextTheme textTheme(
    BuildContext context, {
    bool enableFontScaling = true,
    double? fontScale,
  }) {
    final scale = !enableFontScaling
        ? 1.0
        : (fontScale ?? MediaQuery.textScaleFactorOf(context));
    return TextTheme(
      displayLarge: TextStyle(
          fontSize: 57 * scale,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary(context)),
      displayMedium: TextStyle(
          fontSize: 45 * scale,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary(context)),
      displaySmall: TextStyle(
          fontSize: 36 * scale,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary(context)),
      headlineLarge: TextStyle(
          fontSize: 32 * scale,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary(context)),
      headlineMedium: TextStyle(
          fontSize: 28 * scale,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary(context)),
      headlineSmall: TextStyle(
          fontSize: 24 * scale,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary(context)),
      titleLarge: TextStyle(
          fontSize: 22 * scale,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary(context)),
      titleMedium: TextStyle(
          fontSize: 16 * scale,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary(context)),
      titleSmall: TextStyle(
          fontSize: 14 * scale,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary(context)),
      bodyLarge: TextStyle(
          fontSize: 18 * scale, color: AppColors.textPrimary(context)),
      bodyMedium: TextStyle(
          fontSize: 16 * scale, color: AppColors.textPrimary(context)),
      bodySmall: TextStyle(
          fontSize: 14 * scale, color: AppColors.textSecondary(context)),
      labelLarge: TextStyle(
          fontSize: 14 * scale,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary(context)),
      labelMedium: TextStyle(
          fontSize: 12 * scale, color: AppColors.textSecondary(context)),
      labelSmall: TextStyle(
          fontSize: 11 * scale, color: AppColors.textSecondary(context)),
    );
  }
}
