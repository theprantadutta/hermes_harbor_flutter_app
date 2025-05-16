import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hermes_harbor_flutter_app/riverpods/wishlist_provider.dart';

import '../../components/shared/tab_view_top_app_bar.dart';
import '../../components/wishlist/empty_wishlist.dart';
import '../../components/wishlist/wishlist_product_cart.dart';

class WishlistScreen extends ConsumerStatefulWidget {
  static const kRouteName = '/wishlist';
  const WishlistScreen({super.key});

  @override
  ConsumerState<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends ConsumerState<WishlistScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final wishlistProducts = ref.watch(wishlistProvider);
    final filteredProducts = wishlistProducts.where((product) {
      return product.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // AppBar title
            TabViewTopAppBar(title: 'My WishList'),

            // Search bar
            filteredProducts.isEmpty
                ? const SizedBox.shrink()
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          onChanged: (value) =>
                              setState(() => searchQuery = value),
                          decoration: InputDecoration(
                            hintText: "Search wishlist...",
                            prefixIcon: const Icon(Icons.search),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 12),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),

            // Product list
            Expanded(
              child: filteredProducts.isEmpty
                  ? EmptyWishlist()
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final isLastItem = index == filteredProducts.length - 1;
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: isLastItem
                                  ? kBottomNavigationBarHeight + 25
                                  : 0),
                          child: WishlistProductCard(
                            product: filteredProducts[index],
                          ),
                        );
                      },
                    ),
            ),

            const SizedBox(
              height: kBottomNavigationBarHeight + 25,
            ),
          ],
        ),
      ),
    );
  }
}
