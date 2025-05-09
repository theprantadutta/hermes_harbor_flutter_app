import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animate/flutter_animate.dart' as flutter_animate;
import 'package:google_fonts/google_fonts.dart';

import '../../models/product.dart';
import '../shared/single_product_view.dart';

class RecommendedProducts extends StatelessWidget {
  final List<Product> similarProducts;

  const RecommendedProducts({super.key, required this.similarProducts});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- Section Header ---
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'YOU MAY ALSO LIKE',
            style: GoogleFonts.raleway(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
              color: Colors.grey[600],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // --- Horizontal Scroll ---
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.36,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            itemCount: similarProducts.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (_, index) {
              final product = similarProducts[index];
              return flutter_animate.Animate(
                effects: [flutter_animate.FadeEffect(delay: (100 * index).ms)],
                // child: _RecommendedProductCard(product: product),
                child: SingleProductView(product: product),
              );
            },
          ),
        ),
      ],
    );
  }
}
