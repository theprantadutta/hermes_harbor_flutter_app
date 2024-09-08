import 'package:flutter/material.dart';
import 'package:hermes_harbor_flutter_app/components/shared/categories_view.dart';
import 'package:hermes_harbor_flutter_app/components/shared/page_title_with_back.dart';
import 'package:hermes_harbor_flutter_app/components/view_all/products_filter.dart';
import 'package:hermes_harbor_flutter_app/components/view_all/vertical_products_view.dart';

import '../components/view_all/search_product_field.dart';

class ViewAllScreen extends StatelessWidget {
  static const kRouteName = '/view-all-screen';

  const ViewAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  PageTitleWithBack(title: 'Products'),
                  SearchProductField(),
                ],
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: ProductsFilterDelegate(),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: CategoriesView(),
              ),
            ),
            const VerticalProductsView(),
          ],
        ),
      ),
    );
  }
}

class ProductsFilterDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: const ProductsFilter(),
    );
  }

  @override
  double get maxExtent => 60.0; // Height of the filter bar

  @override
  double get minExtent => 60.0; // Minimum height

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
