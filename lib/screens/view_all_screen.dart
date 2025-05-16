import 'package:flutter/material.dart';
import 'package:hermes_harbor_flutter_app/dummy/popular_product_list.dart';
import 'package:hermes_harbor_flutter_app/dummy/trending_now_list.dart';
import 'package:hermes_harbor_flutter_app/models/product.dart';
import '../components/home/home_screen_categories.dart';
import '../components/shared/page_title_with_back.dart';
import '../components/view_all/products_categories.dart';
import '../dummy/electronics_category_products.dart';
import '../dummy/home_category_products.dart';
import '../dummy/luxury_category_products.dart';
import '../dummy/men_category_products.dart';
import '../dummy/product_list.dart';
import '../dummy/women_category_products.dart';
import '../screen_arguments/view_all_screen_arguments.dart';

import '../components/layouts/main_layout.dart';
import '../components/shared/vertical_products_view.dart';
import '../components/view_all/search_product_field.dart';
import '../dummy/dummy_products.dart';

class ViewAllScreen extends StatefulWidget {
  static const kRouteName = '/view-all-screen';

  final ViewAllScreenArguments? viewAllScreenArguments;

  const ViewAllScreen({
    super.key,
    this.viewAllScreenArguments,
  });

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  late final FocusNode _focusNode;
  String selectedCategory = 'All';
  final allProducts = [
    ...demoProducts,
    ...popularProducts,
    ...trendingNowProducts,
    ...relatedProducts,
    ...menCategoryProducts,
    ...womenCategoryProducts,
    ...luxuryCategoryProducts,
    ...electronicsCategoryProducts,
    ...homeCategoryProducts,
  ];

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    if (widget.viewAllScreenArguments != null) {
      if (widget.viewAllScreenArguments!.focusTextField) {
        _focusNode.requestFocus();
      }
      selectedCategory = widget.viewAllScreenArguments!.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts = [];
    if (selectedCategory == 'All') {
      filteredProducts = allProducts;
    } else {
      filteredProducts =
          allProducts.where((x) => x.category == selectedCategory).toList();
    }
    return MainLayout(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  PageTitleWithBack(title: 'Products'),
                  SearchProductField(
                    focusNode: _focusNode,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 5),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: ProductsFilterDelegate(
                  selectedCategory: selectedCategory,
                  onCategorySelected: (category) {
                    setState(() {
                      selectedCategory = category;
                    });
                  }),
            ),
            VerticalProductsView(demoProducts: filteredProducts),
          ],
        ),
      ),
    );
  }
}

class ProductsFilterDelegate extends SliverPersistentHeaderDelegate {
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  ProductsFilterDelegate({
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      child: ProductsCategories(
        categories: categories,
        selectedCategory: selectedCategory,
        onCategorySelected: onCategorySelected,
      ),
    );
  }

  @override
  double get maxExtent => 60.0; // Height of the filter bar

  @override
  double get minExtent => 60.0; // Minimum height

  @override
  bool shouldRebuild(covariant ProductsFilterDelegate oldDelegate) {
    return oldDelegate.selectedCategory != selectedCategory;
  }
}
