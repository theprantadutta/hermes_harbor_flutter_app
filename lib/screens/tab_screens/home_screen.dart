import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hermes_harbor_flutter_app/components/home/home_screen_categories.dart';
import 'package:hermes_harbor_flutter_app/components/home/home_screen_hero_section.dart';
import 'package:hermes_harbor_flutter_app/components/view_all/search_product_field.dart';
import 'package:hermes_harbor_flutter_app/dummy/curated_for_you_items.dart';
import 'package:hermes_harbor_flutter_app/dummy/popular_product_lilst.dart';
import 'package:hermes_harbor_flutter_app/dummy/trending_now_list.dart';
import 'package:hermes_harbor_flutter_app/screens/view_all_screen.dart';

import '../../components/shared/horizontal_product_view.dart';

class HomeScreen extends StatefulWidget {
  static const kRouteName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController;
  bool _showDarkStatusBar = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      final height = MediaQuery.of(context).size.height * 0.58;
      final newValue =
          _scrollController.offset > height; // Adjust threshold as needed
      if (newValue != _showDarkStatusBar) {
        setState(() => _showDarkStatusBar = newValue);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          HomeScreenHeroSection(showDarkStatusBar: _showDarkStatusBar),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),

          SliverToBoxAdapter(
            child: GestureDetector(
              onTap: () => context.push(
                ViewAllScreen.kRouteName,
              ),
              child: SearchProductField(
                enabled: false,
              ),
            ),
          ),

          // Rest of your content
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 10),
                const HomeScreenCategories(),
                // Trending Now
                HorizontalProductView(
                  title: 'Trending Now',
                  products: trendingNowProducts,
                ),
                // Curated For you
                HorizontalProductView(
                  title: 'Curated for you',
                  products: curatedForYouProducts,
                ),
                // Popular Products
                HorizontalProductView(
                  title: 'Popular Products',
                  products: popularProducts,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
