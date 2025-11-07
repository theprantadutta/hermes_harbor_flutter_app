import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hermes_harbor_flutter_app/riverpods/cart_list_provider.dart';
import 'package:nanoid2/nanoid2.dart';

import '../../constants/animations.dart';
import '../../constants/colors.dart';
import '../../constants/design_tokens.dart';
import '../../models/cart.dart';
import '../../models/product.dart';
import '../../riverpods/wishlist_provider.dart';
import '../../screens/product_detail_screen.dart';

class WishlistProductCard extends ConsumerStatefulWidget {
  final Product product;

  const WishlistProductCard({super.key, required this.product});

  @override
  ConsumerState<WishlistProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends ConsumerState<WishlistProductCard> {
  int quantity = 1;
  bool _heartAnimating = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kPrimaryColor = Theme.of(context).primaryColor;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final product = widget.product;
    final isFavorite =
        ref.watch(wishlistProvider).any((p) => p.id == product.id);
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
              return ProductDetailScreen(
                product: product,
              );
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
          margin: EdgeInsets.symmetric(vertical: AppSpacing.sm),
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs + 1,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDarkTheme
                  ? [
                      Colors.grey[850]!.withOpacity(0.9),
                      Colors.grey[900]!.withOpacity(0.9),
                    ]
                  : [
                      Colors.white,
                      Colors.grey[50]!,
                    ],
            ),
            borderRadius: AppRadius.lgRadius,
            boxShadow: AppElevation.medium(Colors.black),
            border: Border.all(
              color: isDarkTheme
                  ? Colors.white.withOpacity(0.05)
                  : kPrimaryColor.withOpacity(0.08),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image with favorite icon
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: AppRadius.mdRadius,
                    child: CachedNetworkImage(
                      imageUrl: product.images.first,
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        decoration: BoxDecoration(
                          gradient: AppGradients.shimmer,
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        color: AppColors.error,
                      ),
                    ),
                  ),
                  Positioned(
                    top: AppSpacing.sm,
                    right: AppSpacing.sm,
                    child: GestureDetector(
                      onTap: () {
                        setState(() => _heartAnimating = true);
                        Future.delayed(AppDuration.medium, () {
                          if (mounted) setState(() => _heartAnimating = false);
                        });

                        if (isFavorite) {
                          ref
                              .read(wishlistProvider.notifier)
                              .removeFromWishlist(product);
                        } else {
                          ref
                              .read(wishlistProvider.notifier)
                              .addToWishlist(product);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(AppSpacing.sm),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: AppElevation.medium(Colors.black),
                        ),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                          size: AppIconSize.md,
                        ),
                      )
                          .animate(
                            target: _heartAnimating ? 1 : 0,
                          )
                          .scale(
                            begin: const Offset(1.0, 1.0),
                            end: const Offset(1.3, 1.3),
                            duration: AppDuration.fast,
                            curve: AppCurves.spring,
                          )
                          .then()
                          .scale(
                            begin: const Offset(1.3, 1.3),
                            end: const Offset(1.0, 1.0),
                            duration: AppDuration.fast,
                            curve: AppCurves.easeOut,
                          ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSpacing.sm),

              // Title and Price Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Product Name
                  Expanded(
                    child: Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.bodyMedium(
                        weight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // Price
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: AppTextStyle.bodyMedium(
                      weight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSpacing.xs + 2),

              // Rating
              Row(
                children: [
                  Icon(Icons.star, size: AppIconSize.sm, color: Colors.amber),
                  SizedBox(width: AppSpacing.xs),
                  Text(
                    product.rating.toStringAsFixed(1),
                    style: AppTextStyle.bodySmall(),
                  ),
                  Text(
                    ' (${product.reviewCount})',
                    style: AppTextStyle.bodySmall(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSpacing.sm),

              // Add to Cart Row
              Row(
                children: [
                  // Quantity Buttons
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kPrimaryColor.withOpacity(0.2),
                      ),
                      borderRadius: AppRadius.smRadius,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove, size: AppIconSize.sm),
                          onPressed: () {
                            if (quantity > 1) {
                              setState(() => quantity--);
                            }
                          },
                        ),
                        Text(
                          '$quantity',
                          style: AppTextStyle.bodyMedium(
                            weight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add, size: AppIconSize.sm),
                          onPressed: () {
                            setState(() => quantity++);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: AppSpacing.md),

                  // Add to Cart Button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        ref.read(cartListProvider.notifier).addToCart(
                              Cart(
                                id: nanoid(),
                                product: product,
                                quantity: quantity,
                                totalPrice: product.price * quantity,
                              ),
                            );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Product added to cart!'),
                            backgroundColor: AppColors.success,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: AppRadius.mdRadius,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              kPrimaryColor.withOpacity(0.8),
                              kPrimaryColor,
                            ],
                          ),
                          borderRadius: AppRadius.mdRadius,
                          boxShadow: AppElevation.low(kPrimaryColor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                              size: AppIconSize.md,
                            ),
                            SizedBox(width: AppSpacing.xs + 1),
                            Text(
                              'Add to Cart',
                              style: AppTextStyle.bodyMedium(
                                color: Colors.white,
                                weight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ).animate().fadeIn(duration: AppDuration.normal).slideY(
              begin: 0.1,
              duration: AppDuration.normal,
              curve: AppCurves.luxury,
            ),
      ),
    );
  }
}
