import 'package:flutter/material.dart';
import 'package:hermes_harbor_flutter_app/components/shared/page_title_with_back.dart';
import 'package:hermes_harbor_flutter_app/components/view_all/products_categories.dart';
import 'package:hermes_harbor_flutter_app/screen_arguments/view_all_screen_arguments.dart';

import '../components/home/home_screen_categories.dart';
import '../components/layouts/main_layout.dart';
import '../components/shared/vertical_products_view.dart';
import '../components/view_all/search_product_field.dart';

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

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    if (widget.viewAllScreenArguments != null) {
      if (widget.viewAllScreenArguments!.focusTextField) {
        _focusNode.requestFocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
              delegate: ProductsFilterDelegate(),
            ),
            // const SliverToBoxAdapter(
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 12.0),
            //     child: CategoriesView(),
            //   ),
            // ),
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
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      child: const ProductsCategories(
        categories: categories,
      ),
    );
  }

  @override
  double get maxExtent => 60.0; // Height of the filter bar

  @override
  double get minExtent => 60.0; // Minimum height

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
