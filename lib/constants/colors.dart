import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// ============================================================================
// LEGACY HELPER COLORS (Maintained for backwards compatibility)
// ============================================================================
final kHelperColorOne = HexColor('#90a4ae'); // Blue Gray 300, more contrast
final kHelperColorTwo =
    HexColor('#2ecc71').withValues(alpha: 0.7); // Emerald Green
final kHelperColorThree =
    HexColor('#e74c3c').withValues(alpha: 0.9); // Ruby Red

// ============================================================================
// SEMANTIC COLOR SYSTEM
// ============================================================================
/// Semantic colors for consistent UI patterns
class AppColors {
  AppColors._(); // Private constructor

  // Success colors
  static final Color success = HexColor('#2ecc71');
  static final Color successLight = HexColor('#a8e6cf');
  static final Color successDark = HexColor('#27ae60');

  // Error/Danger colors
  static final Color error = HexColor('#e74c3c');
  static final Color errorLight = HexColor('#ffb3ba');
  static final Color errorDark = HexColor('#c0392b');

  // Warning colors
  static final Color warning = HexColor('#f39c12');
  static final Color warningLight = HexColor('#ffe4a3');
  static final Color warningDark = HexColor('#d68910');

  // Info colors
  static final Color info = HexColor('#3498db');
  static final Color infoLight = HexColor('#a3c7e8');
  static final Color infoDark = HexColor('#2980b9');

  // Neutral colors
  static final Color neutral100 = HexColor('#f8f9fa');
  static final Color neutral200 = HexColor('#e9ecef');
  static final Color neutral300 = HexColor('#dee2e6');
  static final Color neutral400 = HexColor('#ced4da');
  static final Color neutral500 = HexColor('#adb5bd');
  static final Color neutral600 = HexColor('#6c757d');
  static final Color neutral700 = HexColor('#495057');
  static final Color neutral800 = HexColor('#343a40');
  static final Color neutral900 = HexColor('#212529');

  // Surface colors (useful for cards, sheets, etc.)
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E1E1E);

  // Background colors
  static final Color backgroundLight = HexColor('#f5f5f5');
  static final Color backgroundDark = HexColor('#121212');

  // Overlay colors
  static const Color overlay = Color(0x66000000); // 40% black
  static const Color overlayLight = Color(0x33000000); // 20% black
  static const Color overlayDark = Color(0x99000000); // 60% black

  // Shimmer colors for loading states
  static const Color shimmerBase = Color(0xFFE0E0E0);
  static const Color shimmerHighlight = Color(0xFFF5F5F5);
  static const Color shimmerBaseDark = Color(0xFF2A2A2A);
  static const Color shimmerHighlightDark = Color(0xFF3A3A3A);
}

// ============================================================================
// GRADIENT PRESETS
// ============================================================================
/// Beautiful gradient presets for backgrounds, cards, and buttons
class AppGradients {
  AppGradients._();

  /// Primary luxury gradient (purple to pink)
  static LinearGradient get luxuryPrimary => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          HexColor('#667eea'),
          HexColor('#764ba2'),
        ],
      );

  /// Sunset gradient (orange to pink)
  static LinearGradient get sunset => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          HexColor('#ff6b6b'),
          HexColor('#feca57'),
        ],
      );

  /// Ocean gradient (blue to teal)
  static LinearGradient get ocean => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          HexColor('#4facfe'),
          HexColor('#00f2fe'),
        ],
      );

  /// Forest gradient (green to teal)
  static LinearGradient get forest => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          HexColor('#11998e'),
          HexColor('#38ef7d'),
        ],
      );

  /// Royal gradient (deep purple to blue)
  static LinearGradient get royal => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          HexColor('#141e30'),
          HexColor('#243b55'),
        ],
      );

  /// Rose gradient (pink to coral)
  static LinearGradient get rose => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          HexColor('#f093fb'),
          HexColor('#f5576c'),
        ],
      );

  /// Premium gradient (gold to orange)
  static LinearGradient get premium => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          HexColor('#f7971e'),
          HexColor('#ffd200'),
        ],
      );

  /// Midnight gradient (dark blue to purple)
  static LinearGradient get midnight => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          HexColor('#2c3e50'),
          HexColor('#3498db'),
        ],
      );

  /// Success gradient
  static LinearGradient get success => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          HexColor('#56ab2f'),
          HexColor('#a8e063'),
        ],
      );

  /// Error gradient
  static LinearGradient get error => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          HexColor('#eb3349'),
          HexColor('#f45c43'),
        ],
      );

  /// Shimmer gradient for loading states
  static LinearGradient get shimmer => const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFFE0E0E0),
          Color(0xFFF5F5F5),
          Color(0xFFE0E0E0),
        ],
        stops: [0.0, 0.5, 1.0],
      );

  /// Shimmer gradient for dark mode
  static LinearGradient get shimmerDark => const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFF2A2A2A),
          Color(0xFF3A3A3A),
          Color(0xFF2A2A2A),
        ],
        stops: [0.0, 0.5, 1.0],
      );

  /// Glass morphism overlay gradient
  static LinearGradient get glass => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withValues(alpha: 0.2),
          Colors.white.withValues(alpha: 0.1),
        ],
      );

  /// Glass morphism overlay gradient for dark mode
  static LinearGradient get glassDark => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withValues(alpha: 0.1),
          Colors.white.withValues(alpha: 0.05),
        ],
      );

  /// Create a custom gradient with primary color
  static LinearGradient primary(Color primaryColor, {double opacity = 1.0}) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        primaryColor.withValues(alpha: opacity),
        primaryColor.withValues(alpha: opacity * 0.7),
      ],
    );
  }

  /// Create a subtle gradient overlay
  static LinearGradient subtle(Color color, {double opacity = 0.1}) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        color.withValues(alpha: opacity),
        color.withValues(alpha: opacity * 0.5),
      ],
    );
  }

  /// Create a vertical gradient
  static LinearGradient vertical(List<Color> colors) {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: colors,
    );
  }

  /// Create a horizontal gradient
  static LinearGradient horizontal(List<Color> colors) {
    return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: colors,
    );
  }

  /// Radial gradient helper
  static RadialGradient radial(List<Color> colors) {
    return RadialGradient(
      center: Alignment.center,
      radius: 1.0,
      colors: colors,
    );
  }
}

// ============================================================================
// COLOR UTILITIES
// ============================================================================
/// Utility extension methods for Color class
extension ColorExtensions on Color {
  /// Get a lighter shade of the color
  Color lighten([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  /// Get a darker shade of the color
  Color darken([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  /// Get the color with specific opacity
  Color withAlpha(double opacity) {
    assert(opacity >= 0 && opacity <= 1);
    return withOpacity(opacity);
  }
}
