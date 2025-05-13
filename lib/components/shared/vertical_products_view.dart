import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../dummy/dummy_products.dart';
import 'two_product_view.dart';

class VerticalProductsView extends StatelessWidget {
  const VerticalProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final firstIndex = index * 2;
            final secondIndex = firstIndex + 1;

            // Don't build if we've reached the end
            if (firstIndex >= demoProducts.length) return null;

            // Check if we have a second product for this row
            final hasSecondProduct = secondIndex < demoProducts.length;

            return Animate(
              effects: [
                FadeEffect(duration: 300.ms),
                SlideEffect(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                  curve: Curves.easeOutQuart,
                  delay: (100 * index).ms,
                ),
              ],
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TwoProductRow(
                  leftProduct: demoProducts[firstIndex],
                  rightProduct:
                      hasSecondProduct ? demoProducts[secondIndex] : null,
                ),
              ),
            );
          },
          // Calculate item count for pairs (round up)
          childCount: (demoProducts.length / 2).ceil(),
        ),
      ),
    );
  }
}
