import 'package:flutter/material.dart';

import '../product_home_tab/product_colors.dart';
import '../product_home_tab/product_review_row.dart';
import '../product_home_tab/product_sizes.dart';
import '../product_home_tab/product_title_description.dart';

class ProductHomeTab extends StatelessWidget {
  const ProductHomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          ProductReviewRow(),
          SizedBox(height: 5),
          ProductTitleDescription(),
          SizedBox(height: 5),
          ProductColors(),
          SizedBox(height: 10),
          ProductSizes(),
        ],
      ),
    );
  }
}
