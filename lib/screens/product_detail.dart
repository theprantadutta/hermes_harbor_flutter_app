import 'package:flutter/material.dart';

import '../components/layouts/main_layout.dart';
import '../components/product_detail/product_home_tab/product_detail_fixed_buttons.dart';
import '../components/product_detail/tabs/product_home_tab.dart';
import '../components/product_detail/tabs/product_reviews_tab.dart';
import '../components/product_detail/tabs/product_similar_tab.dart';

class ProductDetail extends StatelessWidget {
  static const kRouteName = '/product-detail';
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            DefaultTabController(
              length: 3,
              child: CustomScrollView(
                slivers: [
                  // First SliverPersistentHeader for the image
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverAppBarDelegate(
                      expandedHeight: MediaQuery.sizeOf(context).height * 0.45,
                      minHeight: MediaQuery.sizeOf(context).height * 0.25,
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://images.pexels.com/photos/1861907/pexels-photo-1861907.jpeg?cs=srgb&dl=pexels-ronailson-1861907.jpg&fm=jpg&w=640&h=427',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Second SliverPersistentHeader for the TabBar
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _TabBarDelegate(
                      tabBar: const TabBar(
                        tabs: [
                          Tab(
                            icon: Icon(Icons.home_max_outlined),
                            text: 'Home',
                          ),
                          Tab(
                            icon: Icon(Icons.reviews),
                            text: 'Reviews',
                          ),
                          Tab(
                            icon: Icon(Icons.favorite_rounded),
                            text: 'For You',
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Single SliverToBoxAdapter for the TabBarView
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height *
                          0.6, // Adjust height as needed
                      child: const TabBarView(
                        children: [
                          // First Tab - Home Content
                          ProductHomeTab(),
                          // Second Tab - Reviews Content
                          ProductReviewsTab(),
                          // Third Tab - Other Info Content
                          ProductSimilarTab(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Fixed bottom buttons
            const ProductDetailFixedButtons(),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double minHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.expandedHeight,
    required this.minHeight,
    required this.child,
  });

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double t = (maxExtent - shrinkOffset) / maxExtent;
    return Opacity(
      opacity: t,
      child: SizedBox(
        height: expandedHeight,
        child: child,
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate({required this.tabBar});

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tabBar,
    );
  }
}
