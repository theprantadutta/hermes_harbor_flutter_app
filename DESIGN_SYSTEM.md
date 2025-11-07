# Hermes Harbor Design System

## Overview
This document outlines the comprehensive design system implemented for the Hermes Harbor Flutter app. The design system ensures consistency, maintainability, and a premium user experience across all screens.

---

## 📁 Design System Files

### Core Files
- **`lib/constants/design_tokens.dart`** - All design tokens (spacing, radius, elevation, typography, etc.)
- **`lib/constants/colors.dart`** - Color system with gradients and semantic colors
- **`lib/constants/animations.dart`** - Reusable animation presets and micro-interactions

---

## 🎨 Design Tokens

### Spacing Scale (4px Grid System)
```dart
AppSpacing.xxs   // 2px
AppSpacing.xs    // 4px
AppSpacing.sm    // 8px
AppSpacing.md    // 12px
AppSpacing.base  // 16px (default)
AppSpacing.lg    // 24px
AppSpacing.xl    // 32px
AppSpacing.xxl   // 48px
AppSpacing.xxxl  // 64px
```

**Usage:**
```dart
Padding(
  padding: EdgeInsets.all(AppSpacing.base),
  child: ...
)
```

---

### Border Radius Scale
```dart
AppRadius.xs     // 4px
AppRadius.sm     // 8px
AppRadius.md     // 12px
AppRadius.lg     // 16px
AppRadius.xl     // 20px
AppRadius.xxl    // 24px
AppRadius.xxxl   // 32px
AppRadius.full   // 9999px (pill shape)
```

**Common Patterns:**
```dart
// Get BorderRadius object
BorderRadius.circular(AppRadius.md)

// Or use helper methods
AppRadius.mdRadius     // BorderRadius.circular(12)
AppRadius.topLg        // Top corners only
AppRadius.bottomLg     // Bottom corners only
```

---

### Elevation & Shadows
```dart
AppElevation.subtle(color)     // Minimal elevation
AppElevation.low(color)        // Cards and containers
AppElevation.medium(color)     // Prominent cards
AppElevation.high(color)       // Modals and floating elements
AppElevation.extraHigh(color)  // Major floating elements
AppElevation.glow(color)       // Accent elements with glow
```

**Usage:**
```dart
Container(
  decoration: BoxDecoration(
    boxShadow: AppElevation.medium(Colors.black),
  ),
)
```

---

### Typography Scale
```dart
AppTextSize.xs     // 10px
AppTextSize.sm     // 12px
AppTextSize.base   // 14px
AppTextSize.md     // 16px
AppTextSize.lg     // 18px
AppTextSize.xl     // 20px
AppTextSize.xxl    // 24px
AppTextSize.xxxl   // 32px
AppTextSize.huge   // 40px
AppTextSize.massive // 48px
```

**Predefined Text Styles:**
```dart
// Display styles (Large headings)
AppTextStyle.displayLarge()
AppTextStyle.displayMedium()
AppTextStyle.displaySmall()

// Heading styles
AppTextStyle.headingLarge()
AppTextStyle.headingMedium()
AppTextStyle.headingSmall()

// Body styles
AppTextStyle.bodyLarge()
AppTextStyle.bodyMedium()
AppTextStyle.bodySmall()

// Label styles
AppTextStyle.labelLarge()
AppTextStyle.labelMedium()
AppTextStyle.labelSmall()

// Special styles
AppTextStyle.button()
AppTextStyle.caption()
```

**Usage:**
```dart
Text(
  'Hello World',
  style: AppTextStyle.headingLarge(
    color: Colors.black,
    weight: FontWeight.w700,
  ),
)
```

---

### Icon Sizes
```dart
AppIconSize.xs    // 12px
AppIconSize.sm    // 16px
AppIconSize.md    // 20px
AppIconSize.base  // 24px
AppIconSize.lg    // 32px
AppIconSize.xl    // 40px
AppIconSize.xxl   // 48px
AppIconSize.xxxl  // 64px
```

---

### Animation Durations
```dart
AppDuration.instant  // 100ms
AppDuration.fast     // 200ms
AppDuration.normal   // 300ms (default)
AppDuration.medium   // 400ms
AppDuration.slow     // 500ms
AppDuration.slower   // 800ms
AppDuration.slowest  // 1000ms
```

---

### Animation Curves
```dart
// Standard curves
AppCurves.easeIn
AppCurves.easeOut
AppCurves.easeInOut

// Luxury curves (recommended)
AppCurves.smooth       // Smooth transitions
AppCurves.luxury       // Premium feel

// Spring/Bounce curves
AppCurves.spring       // Bouncy animations
AppCurves.bounce
AppCurves.gentleBounce

// Custom curves
AppCurves.luxuryEntry  // For entrance animations
```

---

## 🌈 Color System

### Semantic Colors
```dart
// Success colors
AppColors.success
AppColors.successLight
AppColors.successDark

// Error colors
AppColors.error
AppColors.errorLight
AppColors.errorDark

// Warning colors
AppColors.warning
AppColors.warningLight
AppColors.warningDark

// Info colors
AppColors.info
AppColors.infoLight
AppColors.infoDark

// Neutral scale
AppColors.neutral100  // Lightest
AppColors.neutral500  // Medium
AppColors.neutral900  // Darkest
```

---

### Gradient Presets
```dart
// Luxury gradients
AppGradients.luxuryPrimary  // Purple to pink
AppGradients.sunset         // Orange to pink
AppGradients.ocean          // Blue to teal
AppGradients.forest         // Green to teal
AppGradients.royal          // Deep purple to blue
AppGradients.rose           // Pink to coral
AppGradients.premium        // Gold to orange
AppGradients.midnight       // Dark blue to purple

// Utility gradients
AppGradients.success
AppGradients.error
AppGradients.shimmer
AppGradients.glass

// Custom gradients
AppGradients.primary(color)
AppGradients.subtle(color)
AppGradients.vertical([colors])
AppGradients.horizontal([colors])
AppGradients.radial([colors])
```

**Usage:**
```dart
Container(
  decoration: BoxDecoration(
    gradient: AppGradients.luxuryPrimary,
    borderRadius: AppRadius.lgRadius,
  ),
)
```

---

### Color Utilities
```dart
// Extension methods on Color class
color.lighten(0.1)    // 10% lighter
color.darken(0.1)     // 10% darker
color.withAlpha(0.5)  // 50% opacity
```

---

## ✨ Animation Presets

### Basic Animations
```dart
AppAnimations.fadeIn()
AppAnimations.fadeOut()
AppAnimations.slideInFromBottom()
AppAnimations.slideInFromTop()
AppAnimations.slideInFromLeft()
AppAnimations.slideInFromRight()
AppAnimations.scaleIn()
AppAnimations.scaleOut()
```

### Combined Animations (Entry Effects)
```dart
AppAnimations.fadeSlideInFromBottom()  // Most common
AppAnimations.fadeSlideInFromTop()
AppAnimations.fadeScaleIn()           // Zoom effect
AppAnimations.slideScaleIn()          // Premium entry
```

### Micro-Interactions
```dart
MicroInteractions.buttonPress      // Button press animation
MicroInteractions.cardTap          // Card tap animation
MicroInteractions.heartLike        // Heart/like animation
MicroInteractions.successCheck     // Success checkmark
MicroInteractions.errorShake       // Error shake
MicroInteractions.toastSlideIn     // Toast/Snackbar
MicroInteractions.addToCart        // Add to cart effect
MicroInteractions.badgePop         // Badge pop animation
```

**Usage:**
```dart
// Using flutter_animate
widget.animate().fadeIn(duration: AppDuration.normal)

// Or use presets
Animate(
  effects: AppAnimations.fadeSlideInFromBottom(),
  child: widget,
)

// Staggered animations
widget.animate(
  delay: AppAnimations.staggerDelay(index),
)
```

---

## 🎯 Common Patterns

### Card with Press Animation
```dart
class MyCard extends StatefulWidget {
  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        // Handle tap
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: AppDuration.fast,
        curve: AppCurves.spring,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(...),
            borderRadius: AppRadius.lgRadius,
            boxShadow: AppElevation.medium(Colors.black),
          ),
        ),
      ),
    );
  }
}
```

---

### Gradient Card
```dart
Container(
  padding: EdgeInsets.all(AppSpacing.base),
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: isDarkTheme
        ? [Colors.grey[850]!.withOpacity(0.9), Colors.grey[900]!.withOpacity(0.9)]
        : [Colors.white, Colors.grey[50]!],
    ),
    borderRadius: AppRadius.lgRadius,
    boxShadow: AppElevation.medium(Colors.black),
    border: Border.all(
      color: primaryColor.withOpacity(0.1),
      width: 1,
    ),
  ),
)
```

---

### Shimmer Loading State
```dart
CachedNetworkImage(
  imageUrl: url,
  placeholder: (context, url) => Container(
    decoration: BoxDecoration(
      gradient: AppGradients.shimmer,
    ),
  ),
)
```

---

### Button with Gradient
```dart
Container(
  padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [
        primaryColor.withOpacity(0.8),
        primaryColor,
      ],
    ),
    borderRadius: AppRadius.mdRadius,
    boxShadow: AppElevation.low(primaryColor),
  ),
  child: Text(
    'Button Text',
    style: AppTextStyle.button(color: Colors.white),
  ),
)
```

---

## 🌓 Dark Mode Support

Always check theme brightness:
```dart
final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

// Then use conditional colors
color: isDarkTheme ? Colors.white : Colors.black87,
```

---

## 📊 Component Checklist

When creating a new component, ensure:
- ✅ Use `AppSpacing` for all spacing
- ✅ Use `AppRadius` for all border radius
- ✅ Use `AppElevation` for all shadows
- ✅ Use `AppTextStyle` for all text
- ✅ Use `AppIconSize` for all icons
- ✅ Use `AppDuration` and `AppCurves` for animations
- ✅ Use `AppGradients` or `AppColors` for colors
- ✅ Support dark mode
- ✅ Add press animations for interactive elements
- ✅ Use shimmer loading states for images

---

## 🚀 Performance Tips

1. **Use `const` constructors** wherever possible
2. **Avoid rebuilding** - Use `AnimatedContainer`, `AnimatedScale`, etc.
3. **Keep animations under 500ms** for optimal feel
4. **Use `RepaintBoundary`** for complex widgets
5. **Cache network images** with `CachedNetworkImage`
6. **Use `ListView.builder`** for long lists

---

## 📚 Examples in Codebase

### Well-Implemented Components
- `lib/components/cart/cart_item_card.dart` - Swipe to delete, gradient backgrounds
- `lib/components/wishlist/wishlist_product_cart.dart` - Heart animation, press effects
- `lib/components/cart/quantity_button.dart` - Press animation with controller
- `lib/components/cart/empty_cart.dart` - Staggered animations
- `lib/navigation/bottom_navigation/bottom_navigation_layout.dart` - Glass-morphism
- `lib/components/home/home_screen_categories.dart` - Category cards with animations

---

## 🎨 Design Philosophy

1. **Consistency** - Use design tokens for everything
2. **Premium Feel** - Gradients, shadows, smooth animations
3. **Responsiveness** - Press animations on all interactive elements
4. **Performance** - 60fps animations, optimized rendering
5. **Dark Mode** - Full support across all screens
6. **Accessibility** - Semantic labels, proper contrast ratios

---

## 📝 Notes

- All spacing follows a 4px grid system
- All animations use luxury curves for premium feel
- All interactive elements have press animations
- All cards use gradients and proper elevation
- All images use shimmer loading states
- All components support dark mode

---

**Last Updated:** Phase 5 - Final Touches & Polish
**Version:** 1.0.0
