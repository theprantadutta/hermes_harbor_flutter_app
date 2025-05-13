import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../constants/selectors.dart';
import '../../models/product.dart';
import '../../screens/product_detail_screen.dart';

class TwoProductRow extends StatelessWidget {
  final Product leftProduct;
  final Product? rightProduct;

  const TwoProductRow({
    super.key,
    required this.leftProduct,
    this.rightProduct,
  });

  @override
  Widget build(BuildContext context) {
    final kPrimaryColor = Theme.of(context).primaryColor;

    return Row(
      children: [
        // Left Product
        Expanded(
          child: _buildProductCard(context, leftProduct, kPrimaryColor),
        ),
        const SizedBox(width: 12),
        // Right Product
        Expanded(
          child: (rightProduct != null)
              ? _buildProductCard(context, rightProduct!, kPrimaryColor)
              : SizedBox(
                  width: double.infinity,
                ),
        ),
      ],
    );
  }

  Widget _buildProductCard(
      BuildContext context, Product product, Color kPrimaryColor) {
    return PageTransitionSwitcher(
      duration: const Duration(milliseconds: 600),
      reverse: false,
      transitionBuilder: (child, animation, secondaryAnimation) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.vertical,
          child: child,
        );
      },
      child: GestureDetector(
        key: ValueKey(product.id),
        onTap: () => Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 600),
            pageBuilder: (context, animation, secondaryAnimation) {
              return ProductDetailScreen(product: product);
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SharedAxisTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.scaled,
                child: child,
              );
            },
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: getDefaultGradient(
              kPrimaryColor.withOpacity(0.05),
              kHelperColorThree.withOpacity(0.05),
            ),
            border: Border.all(
              color: Colors.white,
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image with favorite button
              Stack(
                children: [
                  Container(
                    height: 120, // Slightly smaller than single view
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: product.images[0],
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Container(color: Colors.grey[200]),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite_border,
                        size: 16,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Brand tag
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'HERMES HARBOR',
                  style: TextStyle(
                    fontSize: 9, // Smaller font
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.1,
                    color: kPrimaryColor,
                  ),
                ),
              ),

              const SizedBox(height: 6),

              // Product name
              Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13, // Slightly smaller
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 8),

              // Price and rating row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Price
                  Text(
                    '\$${product.price}',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 16, // Slightly smaller
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Rating
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.amber[800],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.white,
                          size: 12, // Smaller
                        ),
                        const SizedBox(width: 2),
                        Text(
                          product.rating.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11, // Smaller
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
            .animate()
            .fadeIn(duration: 300.ms)
            .slideY(begin: 0.1, duration: 300.ms),
      ),
    );
  }
}
