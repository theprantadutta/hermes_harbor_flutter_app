import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../constants/design_tokens.dart';
import '../../constants/selectors.dart';
import '../../models/product.dart';
import '../../screens/product_detail_screen.dart';

class SingleProductView extends StatefulWidget {
  final Product product;
  const SingleProductView({super.key, required this.product});

  @override
  State<SingleProductView> createState() => _SingleProductViewState();
}

class _SingleProductViewState extends State<SingleProductView> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final kPrimaryColor = Theme.of(context).primaryColor;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

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
        key: ValueKey(widget.product.id), // Important for animation
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 600),
              pageBuilder: (context, animation, secondaryAnimation) {
                return ProductDetailScreen(
                  product: widget.product,
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
          );
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedScale(
          scale: _isPressed ? 0.95 : 1.0,
          duration: AppDuration.fast,
          curve: AppCurves.spring,
          child: SizedBox(
            width: AppSizes.productCardWidth,
            child: Stack(
              children: [
                // Background with gradient and enhanced shadow
                Container(
                  margin: EdgeInsets.only(top: AppSpacing.sm),
                  decoration: BoxDecoration(
                    borderRadius: AppRadius.lgRadius,
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
                    boxShadow: [
                      ...AppElevation.medium(Colors.black),
                      BoxShadow(
                        color: kPrimaryColor.withOpacity(0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(
                      color: isDarkTheme
                          ? Colors.white.withOpacity(0.05)
                          : kPrimaryColor.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product image with luxury frame
                      Container(
                        height: 140,
                        margin: EdgeInsets.all(AppSpacing.md),
                        decoration: BoxDecoration(
                          borderRadius: AppRadius.mdRadius,
                          boxShadow: AppElevation.low(Colors.black),
                        ),
                        child: ClipRRect(
                          borderRadius: AppRadius.mdRadius,
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: widget.product.images[0],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                                placeholder: (context, url) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      gradient: AppGradients.shimmer,
                                    ),
                                  );
                                },
                                errorWidget: (context, url, error) {
                                  return Icon(
                                    Icons.error,
                                    color: AppColors.error,
                                  );
                                },
                              ),
                              // Gradient overlay for better text visibility
                              Positioned.fill(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black.withOpacity(0.02),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // Quick view button with glass effect
                              Positioned(
                                bottom: AppSpacing.sm,
                                right: AppSpacing.sm,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.7),
                                    shape: BoxShape.circle,
                                    boxShadow: AppElevation.subtle(Colors.black),
                                  ),
                                  padding: EdgeInsets.all(AppSpacing.xs + 2),
                                  child: Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Colors.white,
                                    size: AppIconSize.sm + 2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Product details
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppSpacing.base),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Brand tag with gradient
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSpacing.sm,
                                vertical: AppSpacing.xxs,
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    kPrimaryColor.withOpacity(0.12),
                                    kPrimaryColor.withOpacity(0.08),
                                  ],
                                ),
                                borderRadius: AppRadius.xsRadius,
                                border: Border.all(
                                  color: kPrimaryColor.withOpacity(0.2),
                                  width: 0.5,
                                ),
                              ),
                              child: Text(
                                'HERMES HARBOR',
                                style: AppTextStyle.labelSmall(
                                  color: kPrimaryColor,
                                  weight: FontWeight.w900,
                                ).copyWith(letterSpacing: 1.2),
                              ),
                            ),
                            SizedBox(height: AppSpacing.sm),
                            // Product name
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.045,
                              child: Text(
                                widget.product.name,
                                style: AppTextStyle.bodyMedium(
                                  weight: FontWeight.w600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(height: AppSpacing.sm),
                            // Price and rating row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Price with gradient styling
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '\$',
                                        style: AppTextStyle.bodyMedium(
                                          color: kPrimaryColor,
                                          weight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: widget.product.price.toString(),
                                        style: GoogleFonts.playfairDisplay(
                                          fontSize: AppTextSize.lg,
                                          color: isDarkTheme
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Luxury rating with gradient
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppSpacing.xs + 2,
                                    vertical: AppSpacing.xxs,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.amber[700]!,
                                        Colors.amber[800]!,
                                      ],
                                    ),
                                    borderRadius: AppRadius.xsRadius,
                                    boxShadow: AppElevation.subtle(Colors.amber),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star_rounded,
                                        color: Colors.white,
                                        size: AppIconSize.sm,
                                      ),
                                      SizedBox(width: AppSpacing.xxs),
                                      Text(
                                        widget.product.rating.toString(),
                                        style: AppTextStyle.labelSmall(
                                          color: Colors.white,
                                          weight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
