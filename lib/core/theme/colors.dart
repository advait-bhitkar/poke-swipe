import 'package:flutter/material.dart';

class AppColors {
  // Light theme colors
  static const Color lightPrimary = Color(0xFF6200EE);
  static const Color lightSecondary = Color(0xFF03DAC6);
  static const Color lightBackground = Color(0xFFF5F5F5);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightError = Color(0xFFB00020);
  static const Color lightTextPrimary = Color(0xFF212121);
  static const Color lightTextSecondary = Color(0xFF757575);
  static const Color lightTertiary = Color(0xFFB388FF);
  static const Color lightOutline = Color(0xFFE0E0E0);
  static const Color lightShadow = Color(0x1A000000);
  static const Color lightGlass = Color(0x80FFFFFF);
  static const Color lightShimmerBase = Color(0xFFE0E0E0);
  static const Color lightShimmerHighlight = Color(0xFFF5F5F5);

  // Dark theme colors
  static const Color darkPrimary = Color(0xFFBB86FC);
  static const Color darkSecondary = Color(0xFF03DAC6);
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkError = Color(0xFFCF6679);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFB3B3B3);
  static const Color darkTertiary = Color(0xFF7C43BD);
  static const Color darkOutline = Color(0xFF333347);
  static const Color darkShadow = Color(0x66000000);
  static const Color darkGlass = Color(0x40FFFFFF);
  static const Color darkShimmerBase = Color(0xFF2C2C2C);
  static const Color darkShimmerHighlight = Color(0xFF444444);

  static Color primary(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? darkPrimary : lightPrimary;
  static Color secondary(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? darkSecondary : lightSecondary;
  static Color background(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? darkBackground : lightBackground;
  static Color surface(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? darkSurface : lightSurface;
  static Color error(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? darkError : lightError;
  static Color textPrimary(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? darkTextPrimary : lightTextPrimary;
  static Color textSecondary(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? darkTextSecondary : lightTextSecondary;
  static Color tertiary(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? darkTertiary : lightTertiary;
  static Color outline(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? darkOutline : lightOutline;
  static Color shadow(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? darkShadow : lightShadow;
  static Color glass(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? darkGlass : lightGlass;
  static Color shimmerBase(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? darkShimmerBase : lightShimmerBase;
  static Color shimmerHighlight(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? darkShimmerHighlight : lightShimmerHighlight;

  static LinearGradient mainGradient(BuildContext context) => LinearGradient(
        colors: [primary(context), secondary(context), tertiary(context)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static BoxDecoration glassBackground(BuildContext context, {double blur = 16, double opacity = 0.4}) {
    return BoxDecoration(
      color: glass(context).withOpacity(opacity),
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color: shadow(context),
          blurRadius: 24,
          offset: Offset(0, 8),
        ),
      ],
      backgroundBlendMode: BlendMode.overlay,
    );
  }
}
