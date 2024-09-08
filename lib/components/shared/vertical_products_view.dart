import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hermes_harbor_flutter_app/components/shared/single_product_view.dart';

class VerticalProductsView extends StatelessWidget {
  const VerticalProductsView({super.key});

  List<Widget> getAllProducts() {
    List<Widget> allProducts = [];
    for (var i = 0; i < 10; i++) {
      allProducts.add(SingleProductView(index: i));
    }
    return allProducts;
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return FadeInUp(
            from: 100,
            duration: Duration(milliseconds: (index + 1) * 150),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SingleProductView(index: index),
            ),
          );
        },
        childCount: 10,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        childAspectRatio: 1 / 1.5, // Adjust ratio to fit product view size
      ),
    );
  }
}
