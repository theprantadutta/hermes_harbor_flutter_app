import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../riverpods/cart_list_provider.dart';

class FloatingCartButton extends ConsumerWidget {
  final bool isActive;
  final VoidCallback onTap;

  const FloatingCartButton({
    super.key,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kPrimaryColor = Theme.of(context).primaryColor;
    final totalQuantity =
        ref.watch(cartListProvider).fold(0, (sum, item) => sum + item.quantity);
    return GestureDetector(
      onTap: onTap,
      child: Animate(
        effects: [ScaleEffect(duration: 300.ms)],
        child: Container(
          width: 56,
          height: 56,
          margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isActive
                  ? [kPrimaryColor, kPrimaryColor.withValues(alpha: 0.8)]
                  : [Colors.grey[800]!, Colors.grey[600]!],
            ),
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor.withValues(alpha: isActive ? 0.4 : 0.1),
                blurRadius: 12,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Badge(
              label: totalQuantity != 0
                  ? Text(totalQuantity > 9 ? '9+' : totalQuantity.toString())
                  : null,
              backgroundColor: Colors.white,
              textColor: kPrimaryColor,
              child: Icon(
                isActive
                    ? Icons.shopping_bag_rounded
                    : Icons.shopping_bag_outlined,
                color: Colors.white,
                size: 26,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
