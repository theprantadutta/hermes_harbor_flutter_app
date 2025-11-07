import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/colors.dart';
import '../../constants/design_tokens.dart';
import '../../riverpods/cart_list_provider.dart';

class FloatingCartButton extends ConsumerStatefulWidget {
  final bool isActive;
  final VoidCallback onTap;

  const FloatingCartButton({
    super.key,
    required this.isActive,
    required this.onTap,
  });

  @override
  ConsumerState<FloatingCartButton> createState() =>
      _FloatingCartButtonState();
}

class _FloatingCartButtonState extends ConsumerState<FloatingCartButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final kPrimaryColor = Theme.of(context).primaryColor;
    final totalQuantity =
        ref.watch(cartListProvider).fold(0, (sum, item) => sum + item.quantity);

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? 0.9 : 1.0,
        duration: AppDuration.fast,
        curve: AppCurves.spring,
        child: Container(
          width: 56,
          height: 56,
          margin: EdgeInsets.only(bottom: AppSpacing.lg),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: widget.isActive
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      kPrimaryColor,
                      kPrimaryColor.lighten(0.1),
                    ],
                  )
                : LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.grey[800]!,
                      Colors.grey[700]!,
                    ],
                  ),
            boxShadow: [
              ...AppElevation.glow(
                kPrimaryColor,
                intensity: widget.isActive ? 0.5 : 0.15,
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Badge(
              label: totalQuantity != 0
                  ? Text(
                      totalQuantity > 9 ? '9+' : totalQuantity.toString(),
                      style: TextStyle(
                        fontSize: AppTextSize.xs,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  : null,
              backgroundColor: Colors.white,
              textColor: kPrimaryColor,
              child: Icon(
                widget.isActive
                    ? Icons.shopping_bag_rounded
                    : Icons.shopping_bag_outlined,
                color: Colors.white,
                size: AppIconSize.lg,
              ),
            )
                .animate(
                  target: totalQuantity > 0 ? 1 : 0,
                )
                .scale(
                  begin: const Offset(1.0, 1.0),
                  end: const Offset(1.2, 1.2),
                  duration: AppDuration.fast,
                  curve: AppCurves.spring,
                )
                .then()
                .scale(
                  begin: const Offset(1.2, 1.2),
                  end: const Offset(1.0, 1.0),
                  duration: AppDuration.fast,
                  curve: AppCurves.easeOut,
                ),
          ),
        ),
      ),
    );
  }
}
