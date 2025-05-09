import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hermes_harbor_flutter_app/components/shared/single_product_view.dart';

import '../../dummy/dummy_products.dart';

class VerticalProductsView extends StatelessWidget {
  const VerticalProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(12),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
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
              child: SingleProductView(
                product: demoProducts[index % demoProducts.length],
              ),
            );
          },
          childCount: demoProducts.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.5,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
        ),
      ),
    );
  }
}
