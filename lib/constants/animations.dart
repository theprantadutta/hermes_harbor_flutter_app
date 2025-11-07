import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'design_tokens.dart';

/// Reusable animation presets and helpers for consistent motion design
/// Uses flutter_animate package for declarative animations

// ============================================================================
// ANIMATION EFFECTS PRESETS
// ============================================================================
class AppAnimations {
  AppAnimations._(); // Private constructor

  // ============================================================================
  // FADE ANIMATIONS
  // ============================================================================

  /// Simple fade in animation
  static List<Effect> fadeIn({
    Duration? duration,
    Duration? delay,
    Curve? curve,
  }) =>
      [
        FadeEffect(
          duration: duration ?? AppDuration.normal,
          delay: delay ?? Duration.zero,
          curve: curve ?? AppCurves.easeOut,
          begin: 0.0,
          end: 1.0,
        ),
      ];

  /// Fade out animation
  static List<Effect> fadeOut({
    Duration? duration,
    Duration? delay,
    Curve? curve,
  }) =>
      [
        FadeEffect(
          duration: duration ?? AppDuration.normal,
          delay: delay ?? Duration.zero,
          curve: curve ?? AppCurves.easeIn,
          begin: 1.0,
          end: 0.0,
        ),
      ];

  // ============================================================================
  // SLIDE ANIMATIONS
  // ============================================================================

  /// Slide in from bottom
  static List<Effect> slideInFromBottom({
    Duration? duration,
    Duration? delay,
    Curve? curve,
    double distance = 30.0,
  }) =>
      [
        SlideEffect(
          duration: duration ?? AppDuration.normal,
          delay: delay ?? Duration.zero,
          curve: curve ?? AppCurves.luxury,
          begin: Offset(0, distance / 100),
          end: Offset.zero,
        ),
      ];

  /// Slide in from top
  static List<Effect> slideInFromTop({
    Duration? duration,
    Duration? delay,
    Curve? curve,
    double distance = 30.0,
  }) =>
      [
        SlideEffect(
          duration: duration ?? AppDuration.normal,
          delay: delay ?? Duration.zero,
          curve: curve ?? AppCurves.luxury,
          begin: Offset(0, -distance / 100),
          end: Offset.zero,
        ),
      ];

  /// Slide in from left
  static List<Effect> slideInFromLeft({
    Duration? duration,
    Duration? delay,
    Curve? curve,
    double distance = 30.0,
  }) =>
      [
        SlideEffect(
          duration: duration ?? AppDuration.normal,
          delay: delay ?? Duration.zero,
          curve: curve ?? AppCurves.luxury,
          begin: Offset(-distance / 100, 0),
          end: Offset.zero,
        ),
      ];

  /// Slide in from right
  static List<Effect> slideInFromRight({
    Duration? duration,
    Duration? delay,
    Curve? curve,
    double distance = 30.0,
  }) =>
      [
        SlideEffect(
          duration: duration ?? AppDuration.normal,
          delay: delay ?? Duration.zero,
          curve: curve ?? AppCurves.luxury,
          begin: Offset(distance / 100, 0),
          end: Offset.zero,
        ),
      ];

  // ============================================================================
  // SCALE ANIMATIONS
  // ============================================================================

  /// Scale up animation (grow from center)
  static List<Effect> scaleIn({
    Duration? duration,
    Duration? delay,
    Curve? curve,
    double begin = 0.0,
  }) =>
      [
        ScaleEffect(
          duration: duration ?? AppDuration.normal,
          delay: delay ?? Duration.zero,
          curve: curve ?? AppCurves.luxury,
          begin: Offset(begin, begin),
          end: const Offset(1.0, 1.0),
        ),
      ];

  /// Scale down animation
  static List<Effect> scaleOut({
    Duration? duration,
    Duration? delay,
    Curve? curve,
  }) =>
      [
        ScaleEffect(
          duration: duration ?? AppDuration.normal,
          delay: delay ?? Duration.zero,
          curve: curve ?? AppCurves.easeIn,
          begin: const Offset(1.0, 1.0),
          end: const Offset(0.0, 0.0),
        ),
      ];

  /// Gentle scale bounce (for micro-interactions)
  static List<Effect> scaleBounce({
    Duration? duration,
    Curve? curve,
  }) =>
      [
        ScaleEffect(
          duration: duration ?? AppDuration.fast,
          curve: curve ?? AppCurves.spring,
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.1, 1.1),
        ),
        ScaleEffect(
          duration: duration ?? AppDuration.fast,
          delay: duration ?? AppDuration.fast,
          curve: curve ?? AppCurves.spring,
          begin: const Offset(1.1, 1.1),
          end: const Offset(1.0, 1.0),
        ),
      ];

  // ============================================================================
  // COMBINED ANIMATIONS (Entry Effects)
  // ============================================================================

  /// Fade + slide from bottom (most common entry animation)
  static List<Effect> fadeSlideInFromBottom({
    Duration? duration,
    Duration? delay,
    Curve? curve,
    double distance = 30.0,
  }) =>
      [
        FadeEffect(
          duration: duration ?? AppDuration.normal,
          delay: delay ?? Duration.zero,
          curve: curve ?? AppCurves.easeOut,
          begin: 0.0,
          end: 1.0,
        ),
        SlideEffect(
          duration: duration ?? AppDuration.normal,
          delay: delay ?? Duration.zero,
          curve: curve ?? AppCurves.luxury,
          begin: Offset(0, distance / 100),
          end: Offset.zero,
        ),
      ];

  /// Fade + slide from top
  static List<Effect> fadeSlideInFromTop({
    Duration? duration,
    Duration? delay,
    Curve? curve,
    double distance = 30.0,
  }) =>
      [
        FadeEffect(
          duration: duration ?? AppDuration.normal,
          delay: delay ?? Duration.zero,
          curve: curve ?? AppCurves.easeOut,
          begin: 0.0,
          end: 1.0,
        ),
        SlideEffect(
          duration: duration ?? AppDuration.normal,
          delay: delay ?? Duration.zero,
          curve: curve ?? AppCurves.luxury,
          begin: Offset(0, -distance / 100),
          end: Offset.zero,
        ),
      ];

  /// Fade + scale (zoom in effect)
  static List<Effect> fadeScaleIn({
    Duration? duration,
    Duration? delay,
    Curve? curve,
    double begin = 0.8,
  }) =>
      [
        FadeEffect(
          duration: duration ?? AppDuration.normal,
          delay: delay ?? Duration.zero,
          curve: curve ?? AppCurves.easeOut,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          duration: duration ?? AppDuration.normal,
          delay: delay ?? Duration.zero,
          curve: curve ?? AppCurves.luxury,
          begin: Offset(begin, begin),
          end: const Offset(1.0, 1.0),
        ),
      ];

  /// Slide + scale (premium entry effect)
  static List<Effect> slideScaleIn({
    Duration? duration,
    Duration? delay,
    Curve? curve,
    double distance = 20.0,
    double scaleBegin = 0.95,
  }) =>
      [
        SlideEffect(
          duration: duration ?? AppDuration.normal,
          delay: delay ?? Duration.zero,
          curve: curve ?? AppCurves.luxury,
          begin: Offset(0, distance / 100),
          end: Offset.zero,
        ),
        ScaleEffect(
          duration: duration ?? AppDuration.normal,
          delay: delay ?? Duration.zero,
          curve: curve ?? AppCurves.luxury,
          begin: Offset(scaleBegin, scaleBegin),
          end: const Offset(1.0, 1.0),
        ),
      ];

  // ============================================================================
  // SHIMMER EFFECTS (Loading States)
  // ============================================================================

  /// Shimmer animation for loading skeletons
  static List<Effect> shimmer({
    Duration? duration,
    Duration? delay,
  }) =>
      [
        ShimmerEffect(
          duration: duration ?? const Duration(milliseconds: 1500),
          delay: delay ?? Duration.zero,
          color: Colors.white.withOpacity(0.5),
        ),
      ];

  // ============================================================================
  // SHAKE/WOBBLE EFFECTS (Error/Attention)
  // ============================================================================

  /// Shake animation (for errors or validation)
  static List<Effect> shake({
    Duration? duration,
    double intensity = 10.0,
  }) =>
      [
        ShakeEffect(
          duration: duration ?? AppDuration.medium,
          hz: 4,
          offset: Offset(intensity, 0),
          curve: Curves.easeInOut,
        ),
      ];

  // ============================================================================
  // ROTATION EFFECTS
  // ============================================================================

  /// Spin animation (360 degrees)
  static List<Effect> spin({
    Duration? duration,
    Duration? delay,
    Curve? curve,
  }) =>
      [
        RotateEffect(
          duration: duration ?? AppDuration.slow,
          delay: delay ?? Duration.zero,
          curve: curve ?? Curves.linear,
          begin: 0.0,
          end: 1.0,
        ),
      ];

  // ============================================================================
  // BLUR EFFECTS
  // ============================================================================

  /// Blur in effect (from blurry to clear)
  static List<Effect> blurIn({
    Duration? duration,
    Duration? delay,
    double beginBlur = 10.0,
  }) =>
      [
        BlurEffect(
          duration: duration ?? AppDuration.normal,
          delay: delay ?? Duration.zero,
          curve: AppCurves.easeOut,
          begin: Offset(beginBlur, beginBlur),
          end: Offset.zero,
        ),
      ];

  // ============================================================================
  // STAGGER HELPERS
  // ============================================================================

  /// Create a staggered delay for list items
  /// Use with .animate(delay: AppAnimations.staggerDelay(index))
  static Duration staggerDelay(
    int index, {
    Duration baseDelay = Duration.zero,
    Duration increment = const Duration(milliseconds: 50),
  }) {
    return baseDelay + (increment * index);
  }
}

// ============================================================================
// MICRO-INTERACTION PRESETS
// ============================================================================
/// Ready-to-use animation combinations for common UI elements
class MicroInteractions {
  MicroInteractions._();

  /// Button press animation
  static List<Effect> get buttonPress => [
        ScaleEffect(
          duration: AppDuration.fast,
          curve: AppCurves.easeOut,
          begin: const Offset(1.0, 1.0),
          end: const Offset(0.95, 0.95),
        ),
      ];

  /// Card hover/tap animation
  static List<Effect> get cardTap => [
        ScaleEffect(
          duration: AppDuration.fast,
          curve: AppCurves.spring,
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.02, 1.02),
        ),
      ];

  /// Heart/like animation
  static List<Effect> get heartLike => [
        ScaleEffect(
          duration: AppDuration.fast,
          curve: AppCurves.spring,
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.3, 1.3),
        ),
        ScaleEffect(
          duration: AppDuration.fast,
          delay: AppDuration.fast,
          curve: AppCurves.spring,
          begin: const Offset(1.3, 1.3),
          end: const Offset(1.0, 1.0),
        ),
      ];

  /// Success checkmark animation
  static List<Effect> get successCheck => [
        ScaleEffect(
          duration: AppDuration.medium,
          curve: AppCurves.spring,
          begin: const Offset(0.0, 0.0),
          end: const Offset(1.2, 1.2),
        ),
        ScaleEffect(
          duration: AppDuration.fast,
          delay: AppDuration.medium,
          curve: AppCurves.easeOut,
          begin: const Offset(1.2, 1.2),
          end: const Offset(1.0, 1.0),
        ),
      ];

  /// Error shake
  static List<Effect> get errorShake => AppAnimations.shake();

  /// Toast/Snackbar slide in from bottom
  static List<Effect> get toastSlideIn => AppAnimations.fadeSlideInFromBottom(
        duration: AppDuration.medium,
      );

  /// Modal backdrop fade
  static List<Effect> get backdropFade => AppAnimations.fadeIn(
        duration: AppDuration.normal,
      );

  /// Product add to cart animation
  static List<Effect> get addToCart => [
        ScaleEffect(
          duration: AppDuration.fast,
          curve: AppCurves.spring,
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.1, 1.1),
        ),
        ScaleEffect(
          duration: AppDuration.normal,
          delay: AppDuration.fast,
          curve: AppCurves.easeOut,
          begin: const Offset(1.1, 1.1),
          end: const Offset(0.0, 0.0),
        ),
      ];

  /// Badge pop animation
  static List<Effect> get badgePop => [
        ScaleEffect(
          duration: AppDuration.fast,
          curve: AppCurves.spring,
          begin: const Offset(0.0, 0.0),
          end: const Offset(1.2, 1.2),
        ),
        ScaleEffect(
          duration: AppDuration.fast,
          delay: AppDuration.fast,
          curve: AppCurves.easeOut,
          begin: const Offset(1.2, 1.2),
          end: const Offset(1.0, 1.0),
        ),
      ];
}

// ============================================================================
// PAGE TRANSITION BUILDERS
// ============================================================================
/// Custom page transitions for navigation
class AppPageTransitions {
  AppPageTransitions._();

  /// Fade transition
  static PageTransitionsBuilder get fade => const FadeUpwardsPageTransitionsBuilder();

  /// Slide from right (iOS style)
  static Widget slideFromRight(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: AppCurves.luxury,
      )),
      child: child,
    );
  }

  /// Slide from bottom (Modal style)
  static Widget slideFromBottom(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: AppCurves.luxury,
      )),
      child: child,
    );
  }

  /// Scale + fade transition
  static Widget scaleFade(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return ScaleTransition(
      scale: Tween<double>(
        begin: 0.8,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: AppCurves.luxury,
      )),
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}

// ============================================================================
// ANIMATION UTILITIES
// ============================================================================
extension AnimationExtensions on Widget {
  /// Quick fade in animation
  Widget fadeIn({
    Duration? duration,
    Duration? delay,
  }) =>
      animate(delay: delay).fade(
            duration: duration ?? AppDuration.normal,
            curve: AppCurves.easeOut,
          );

  /// Quick slide + fade in animation
  Widget slideInFromBottom({
    Duration? duration,
    Duration? delay,
    double distance = 30.0,
  }) =>
      animate(delay: delay)
          .fadeIn(duration: duration ?? AppDuration.normal)
          .slideY(
            begin: distance / 100,
            duration: duration ?? AppDuration.normal,
            curve: AppCurves.luxury,
          );

  /// Quick scale in animation
  Widget scaleIn({
    Duration? duration,
    Duration? delay,
    double begin = 0.8,
  }) =>
      animate(delay: delay).scale(
            begin: Offset(begin, begin),
            duration: duration ?? AppDuration.normal,
            curve: AppCurves.luxury,
          );
}
