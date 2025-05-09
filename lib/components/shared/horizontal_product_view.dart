import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../models/product.dart';
import '../../screens/view_all_screen.dart';
import 'single_product_view.dart';

class HorizontalProductView extends StatelessWidget {
  final String title;
  final List<Product> products;

  const HorizontalProductView({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Enhanced section header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
              ),
              TextButton(
                onPressed: () {
                  context.push(ViewAllScreen.kRouteName);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor,
                ),
                child: const Text('See All'),
              ),
            ],
          ),
          // Product cards with improved design
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.36,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemBuilder: (context, index) => Animate(
                effects: [
                  FadeEffect(duration: 300.ms),
                  SlideEffect(
                    begin: const Offset(0.2, 0),
                    end: Offset.zero,
                    curve: Curves.easeOutQuart,
                  ),
                ],
                child: SingleProductView(product: products[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
