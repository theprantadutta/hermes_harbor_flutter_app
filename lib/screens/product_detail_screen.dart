import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nanoid2/nanoid2.dart';

import '../components/product_detail/add_to_cart_bar.dart';
import '../components/product_detail/product_description.dart';
import '../components/product_detail/product_hero_section.dart';
import '../components/product_detail/product_info_section.dart';
import '../components/product_detail/product_reviews_section.dart';
import '../components/product_detail/recommended_products.dart';
import '../dummy/dummy_reviews.dart';
import '../dummy/product_list.dart';
import '../models/cart.dart';
import '../models/product.dart';
import '../riverpods/cart_list_provider.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  static const kRouteName = '/product-detail';
  final Product product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.5;
    return Scaffold(
      body: BackButtonListener(
        onBackButtonPressed: () async {
          Navigator.pop(context);
          return true;
        },
        child: CustomScrollView(
          slivers: [
            // --- Hero Image ---
            SliverAppBar(
              systemOverlayStyle: SystemUiOverlayStyle.light,
              expandedHeight: height,
              flexibleSpace: ProductHeroSection(
                images: widget.product.images,
              ),
              pinned: true,
              collapsedHeight: MediaQuery.sizeOf(context).height * 0.3,
              iconTheme: IconThemeData(
                color: Colors.transparent,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            // --- Product Info ---
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ProductInfoSection(
                    product: widget.product,
                  ),
                  const SizedBox(height: 20),
                  ProductDescription(description: widget.product.description),
                  const SizedBox(height: 15),
                ],
              ),
            ),

            // --- Recommendations ---
            SliverToBoxAdapter(
              child: RecommendedProducts(
                // similarProducts: ProductService.getSimilarProducts(product.id),
                similarProducts: relatedProducts,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: ProductReviewsSection(
                averageRating: widget.product.rating,
                reviewCount: widget.product.reviewCount,
                reviews: dummyReviews,
              ),
            ),
          ],
        ),
      ),

      // --- Sticky Add-to-Cart Bar ---
      bottomNavigationBar: AddToCartBar(
        quantity: quantity,
        increment: () => setState(() => quantity++),
        decrement: () {
          if (quantity == 1) return;
          setState(() => quantity--);
        },
        addToCart: () {
          ref.read(cartListProvider.notifier).addToCart(
                Cart(
                  id: nanoid(),
                  product: widget.product,
                  quantity: quantity,
                  totalPrice: widget.product.price * quantity,
                ),
              );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${widget.product.name} added to cart!')),
          );
        },
      ),
    );
  }
}
