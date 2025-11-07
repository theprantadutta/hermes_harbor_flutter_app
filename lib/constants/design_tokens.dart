import 'package:flutter/material.dart';

/// Design Tokens - Centralized design system constants
/// This file contains all spacing, sizing, radius, elevation, and animation constants
/// for consistent design throughout the Hermes Harbor app

// ============================================================================
// SPACING SCALE
// ============================================================================
/// Based on 4px grid system for consistent spacing
class AppSpacing {
  AppSpacing._(); // Private constructor to prevent instantiation

  static const double xxs = 2.0;   // Extra extra small
  static const double xs = 4.0;    // Extra small
  static const double sm = 8.0;    // Small
  static const double md = 12.0;   // Medium small
  static const double base = 16.0; // Base/Default
  static const double lg = 24.0;   // Large
  static const double xl = 32.0;   // Extra large
  static const double xxl = 48.0;  // Extra extra large
  static const double xxxl = 64.0; // Huge
}

// ============================================================================
// BORDER RADIUS SCALE
// ============================================================================
/// Consistent border radius values for cards, buttons, and containers
class AppRadius {
  AppRadius._();

  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double xxxl = 32.0;
  static const double full = 9999.0; // Pill shape

  // Commonly used BorderRadius objects
  static BorderRadius get xsRadius => BorderRadius.circular(xs);
  static BorderRadius get smRadius => BorderRadius.circular(sm);
  static BorderRadius get mdRadius => BorderRadius.circular(md);
  static BorderRadius get lgRadius => BorderRadius.circular(lg);
  static BorderRadius get xlRadius => BorderRadius.circular(xl);
  static BorderRadius get xxlRadius => BorderRadius.circular(xxl);
  static BorderRadius get xxxlRadius => BorderRadius.circular(xxxl);
  static BorderRadius get fullRadius => BorderRadius.circular(full);

  // Special radius combinations
  static BorderRadius get topLg => const BorderRadius.only(
        topLeft: Radius.circular(lg),
        topRight: Radius.circular(lg),
      );

  static BorderRadius get topXl => const BorderRadius.only(
        topLeft: Radius.circular(xl),
        topRight: Radius.circular(xl),
      );

  static BorderRadius get bottomLg => const BorderRadius.only(
        bottomLeft: Radius.circular(lg),
        bottomRight: Radius.circular(lg),
      );
}

// ============================================================================
// ELEVATION & SHADOW PRESETS
// ============================================================================
/// Predefined shadow styles for consistent depth perception
class AppElevation {
  AppElevation._();

  /// Subtle shadow for minimal elevation
  static List<BoxShadow> subtle(Color color) => [
        BoxShadow(
          color: color.withValues(alpha: 0.05),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ];

  /// Low elevation shadow for cards and containers
  static List<BoxShadow> low(Color color) => [
        BoxShadow(
          color: color.withValues(alpha: 0.08),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
        BoxShadow(
          color: color.withValues(alpha: 0.04),
          blurRadius: 4,
          offset: const Offset(0, 1),
        ),
      ];

  /// Medium elevation for prominent cards
  static List<BoxShadow> medium(Color color) => [
        BoxShadow(
          color: color.withValues(alpha: 0.12),
          blurRadius: 16,
          offset: const Offset(0, 4),
        ),
        BoxShadow(
          color: color.withValues(alpha: 0.06),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ];

  /// High elevation for modals and floating elements
  static List<BoxShadow> high(Color color) => [
        BoxShadow(
          color: color.withValues(alpha: 0.15),
          blurRadius: 24,
          offset: const Offset(0, 8),
        ),
        BoxShadow(
          color: color.withValues(alpha: 0.08),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ];

  /// Extra high elevation for major floating elements
  static List<BoxShadow> extraHigh(Color color) => [
        BoxShadow(
          color: color.withValues(alpha: 0.2),
          blurRadius: 40,
          offset: const Offset(0, 12),
        ),
        BoxShadow(
          color: color.withValues(alpha: 0.12),
          blurRadius: 20,
          offset: const Offset(0, 6),
        ),
      ];

  /// Glow effect for accent elements
  static List<BoxShadow> glow(Color color, {double intensity = 0.4}) => [
        BoxShadow(
          color: color.withValues(alpha: intensity),
          blurRadius: 20,
          spreadRadius: 2,
        ),
        BoxShadow(
          color: color.withValues(alpha: intensity * 0.5),
          blurRadius: 40,
          spreadRadius: 4,
        ),
      ];

  /// Inner shadow effect (simulate with border)
  static List<BoxShadow> inner(Color color) => [
        BoxShadow(
          color: color.withValues(alpha: 0.1),
          blurRadius: 4,
          offset: const Offset(0, 2),
          spreadRadius: -2,
        ),
      ];
}

// ============================================================================
// ANIMATION DURATION CONSTANTS
// ============================================================================
/// Standard animation durations for consistent motion
class AppDuration {
  AppDuration._();

  static const Duration instant = Duration(milliseconds: 100);
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration medium = Duration(milliseconds: 400);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration slower = Duration(milliseconds: 800);
  static const Duration slowest = Duration(milliseconds: 1000);
}

// ============================================================================
// ANIMATION CURVES
// ============================================================================
/// Custom animation curves for luxury feel
class AppCurves {
  AppCurves._();

  // Standard curves
  static const Curve easeIn = Curves.easeIn;
  static const Curve easeOut = Curves.easeOut;
  static const Curve easeInOut = Curves.easeInOut;

  // Material Design curves
  static const Curve standard = Curves.easeInOut;
  static const Curve emphasized = Curves.easeInOutCubicEmphasized;
  static const Curve decelerate = Curves.decelerate;
  static const Curve accelerate = Curves.easeIn;

  // Luxury/Premium curves
  static const Curve smooth = Curves.easeInOutQuart;
  static const Curve luxury = Curves.easeInOutCubic;

  // Spring/Bounce curves
  static const Curve spring = Curves.elasticOut;
  static const Curve bounce = Curves.bounceOut;
  static const Curve gentleBounce = Curves.elasticInOut;

  // Custom cubic bezier curves
  static const Curve customEase = Cubic(0.4, 0.0, 0.2, 1.0);
  static const Curve smoothEntry = Cubic(0.0, 0.0, 0.2, 1.0);
  static const Curve smoothExit = Cubic(0.4, 0.0, 1.0, 1.0);
  static const Curve luxuryEntry = Cubic(0.22, 1.0, 0.36, 1.0);
}

// ============================================================================
// OPACITY SCALE
// ============================================================================
/// Standard opacity values for consistency
class AppOpacity {
  AppOpacity._();

  static const double minimal = 0.05;
  static const double subtle = 0.1;
  static const double light = 0.2;
  static const double medium = 0.4;
  static const double strong = 0.6;
  static const double veryStrong = 0.8;
  static const double almostFull = 0.9;
  static const double full = 1.0;
}

// ============================================================================
// ICON SIZES
// ============================================================================
/// Consistent icon sizing
class AppIconSize {
  AppIconSize._();

  static const double xs = 12.0;
  static const double sm = 16.0;
  static const double md = 20.0;
  static const double base = 24.0;
  static const double lg = 32.0;
  static const double xl = 40.0;
  static const double xxl = 48.0;
  static const double xxxl = 64.0;
}

// ============================================================================
// TYPOGRAPHY SCALE
// ============================================================================
/// Text size constants following type scale
class AppTextSize {
  AppTextSize._();

  static const double xs = 10.0;
  static const double sm = 12.0;
  static const double base = 14.0;
  static const double md = 16.0;
  static const double lg = 18.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double xxxl = 32.0;
  static const double huge = 40.0;
  static const double massive = 48.0;
}

// ============================================================================
// TYPOGRAPHY STYLES
// ============================================================================
/// Predefined text styles for consistent typography
class AppTextStyle {
  AppTextStyle._();

  // Display styles (Large headings)
  static TextStyle displayLarge({Color? color, FontWeight? weight}) => TextStyle(
        fontSize: AppTextSize.massive,
        fontWeight: weight ?? FontWeight.w700,
        height: 1.2,
        color: color,
        letterSpacing: -0.5,
      );

  static TextStyle displayMedium({Color? color, FontWeight? weight}) => TextStyle(
        fontSize: AppTextSize.huge,
        fontWeight: weight ?? FontWeight.w700,
        height: 1.2,
        color: color,
        letterSpacing: -0.25,
      );

  static TextStyle displaySmall({Color? color, FontWeight? weight}) => TextStyle(
        fontSize: AppTextSize.xxxl,
        fontWeight: weight ?? FontWeight.w600,
        height: 1.25,
        color: color,
      );

  // Heading styles
  static TextStyle headingLarge({Color? color, FontWeight? weight}) => TextStyle(
        fontSize: AppTextSize.xxl,
        fontWeight: weight ?? FontWeight.w600,
        height: 1.3,
        color: color,
      );

  static TextStyle headingMedium({Color? color, FontWeight? weight}) => TextStyle(
        fontSize: AppTextSize.xl,
        fontWeight: weight ?? FontWeight.w600,
        height: 1.3,
        color: color,
      );

  static TextStyle headingSmall({Color? color, FontWeight? weight}) => TextStyle(
        fontSize: AppTextSize.lg,
        fontWeight: weight ?? FontWeight.w600,
        height: 1.4,
        color: color,
      );

  // Body styles
  static TextStyle bodyLarge({Color? color, FontWeight? weight}) => TextStyle(
        fontSize: AppTextSize.md,
        fontWeight: weight ?? FontWeight.w400,
        height: 1.5,
        color: color,
      );

  static TextStyle bodyMedium({Color? color, FontWeight? weight}) => TextStyle(
        fontSize: AppTextSize.base,
        fontWeight: weight ?? FontWeight.w400,
        height: 1.5,
        color: color,
      );

  static TextStyle bodySmall({Color? color, FontWeight? weight}) => TextStyle(
        fontSize: AppTextSize.sm,
        fontWeight: weight ?? FontWeight.w400,
        height: 1.5,
        color: color,
      );

  // Label styles
  static TextStyle labelLarge({Color? color, FontWeight? weight}) => TextStyle(
        fontSize: AppTextSize.base,
        fontWeight: weight ?? FontWeight.w500,
        height: 1.4,
        color: color,
        letterSpacing: 0.1,
      );

  static TextStyle labelMedium({Color? color, FontWeight? weight}) => TextStyle(
        fontSize: AppTextSize.sm,
        fontWeight: weight ?? FontWeight.w500,
        height: 1.4,
        color: color,
        letterSpacing: 0.5,
      );

  static TextStyle labelSmall({Color? color, FontWeight? weight}) => TextStyle(
        fontSize: AppTextSize.xs,
        fontWeight: weight ?? FontWeight.w500,
        height: 1.4,
        color: color,
        letterSpacing: 0.5,
      );

  // Special styles
  static TextStyle button({Color? color}) => TextStyle(
        fontSize: AppTextSize.base,
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: color,
        letterSpacing: 0.5,
      );

  static TextStyle caption({Color? color}) => TextStyle(
        fontSize: AppTextSize.xs,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: color,
      );
}

// ============================================================================
// COMMON SIZES
// ============================================================================
/// Common dimension constants
class AppSizes {
  AppSizes._();

  // Button sizes
  static const double buttonHeightSm = 36.0;
  static const double buttonHeightMd = 44.0;
  static const double buttonHeightLg = 52.0;

  // Input sizes
  static const double inputHeight = 48.0;
  static const double inputHeightSm = 40.0;
  static const double inputHeightLg = 56.0;

  // Card sizes
  static const double productCardWidth = 180.0;
  static const double productCardHeight = 240.0;

  // Icon button sizes
  static const double iconButtonSm = 32.0;
  static const double iconButtonMd = 40.0;
  static const double iconButtonLg = 48.0;

  // Avatar sizes
  static const double avatarSm = 32.0;
  static const double avatarMd = 48.0;
  static const double avatarLg = 64.0;
  static const double avatarXl = 96.0;

  // App bar
  static const double appBarHeight = 56.0;
  static const double bottomNavHeight = 64.0;

  // Divider
  static const double dividerThickness = 1.0;
  static const double dividerThicknessBold = 2.0;
}
