import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/product_detail/add_to_cart_bar.dart';
import '../components/product_detail/product_description.dart';
import '../components/product_detail/product_hero_section.dart';
import '../components/product_detail/product_info_section.dart';
import '../components/product_detail/product_reviews_section.dart';
import '../components/product_detail/recommended_products.dart';
import '../dummy/dummy_reviews.dart';
import '../dummy/product_list.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static const kRouteName = '/product-detail';
  final Product product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

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
                images: product.images,
                productId: product.id,
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
                    title: product.name,
                    price: product.price,
                    rating: product.rating,
                    availableColors: product.availableColors,
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 15),
                  ProductDescription(description: product.description),
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
                averageRating: product.rating,
                reviewCount: product.reviewCount,
                reviews: dummyReviews,
              ),
            ),
          ],
        ),
      ),

      // --- Sticky Add-to-Cart Bar ---
      bottomNavigationBar: AddToCartBar(),
    );
  }
}
