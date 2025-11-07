import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hermes_harbor_flutter_app/riverpods/cart_list_provider.dart';

import '../../constants/colors.dart';
import '../../constants/design_tokens.dart';
import '../../models/cart.dart';
import 'quantity_button.dart';

class CartItemCard extends ConsumerStatefulWidget {
  final Cart cart;
  final VoidCallback onDelete;

  const CartItemCard({
    super.key,
    required this.cart,
    required this.onDelete,
  });

  @override
  ConsumerState<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends ConsumerState<CartItemCard> {
  bool _isRemoving = false;

  @override
  Widget build(BuildContext context) {
    final kPrimaryColor = Theme.of(context).primaryColor;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Dismissible(
      key: Key(widget.cart.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        widget.onDelete();
      },
      background: Container(
        margin: EdgeInsets.symmetric(vertical: AppSpacing.xs),
        decoration: BoxDecoration(
          gradient: AppGradients.error,
          borderRadius: AppRadius.mdRadius,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: AppSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.delete_outline,
              color: Colors.white,
              size: AppIconSize.lg,
            ),
            SizedBox(height: AppSpacing.xxs),
            Text(
              'Remove',
              style: AppTextStyle.labelSmall(
                color: Colors.white,
                weight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: AppSpacing.xs),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDarkTheme
                ? [
                    Colors.grey[850]!.withValues(alpha: 0.9),
                    Colors.grey[900]!.withValues(alpha: 0.9),
                  ]
                : [
                    Colors.white,
                    Colors.grey[50]!,
                  ],
          ),
          borderRadius: AppRadius.mdRadius,
          boxShadow: AppElevation.medium(Colors.black),
          border: Border.all(
            color: isDarkTheme
                ? Colors.white.withValues(alpha: 0.05)
                : kPrimaryColor.withValues(alpha: 0.08),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Image
            Padding(
              padding: EdgeInsets.all(AppSpacing.sm),
              child: ClipRRect(
                borderRadius: AppRadius.smRadius,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: AppElevation.low(Colors.black),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: widget.cart.product.images.first,
                    width: 90,
                    height: 90,
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
              ),
            ),

            // Info
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.md,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cart.product.name,
                      style: AppTextStyle.bodyMedium(
                        weight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: AppSpacing.xs),
                    Text(
                      "\$${widget.cart.product.price.toStringAsFixed(2)}",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: AppTextSize.md,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: AppSpacing.sm),
                    Row(
                      children: [
                        QuantityButton(
                          icon: Icons.remove,
                          onTap: () {
                            if (widget.cart.quantity == 1) return;
                            ref
                                .read(cartListProvider.notifier)
                                .decrementQuantity(widget.cart.product.id);
                          },
                        ),
                        SizedBox(width: AppSpacing.sm),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.md,
                            vertical: AppSpacing.xs,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                kPrimaryColor.withValues(alpha: 0.1),
                                kPrimaryColor.withValues(alpha: 0.05),
                              ],
                            ),
                            borderRadius: AppRadius.smRadius,
                            border: Border.all(
                              color: kPrimaryColor.withValues(alpha: 0.2),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            widget.cart.quantity.toString(),
                            style: AppTextStyle.bodyMedium(
                              weight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                        SizedBox(width: AppSpacing.sm),
                        QuantityButton(
                          icon: Icons.add,
                          onTap: () {
                            ref
                                .read(cartListProvider.notifier)
                                .incrementQuantity(widget.cart.product.id);
                          },
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() => _isRemoving = true);
                            Future.delayed(AppDuration.normal, () {
                              widget.onDelete();
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(AppSpacing.xs),
                            decoration: BoxDecoration(
                              color: AppColors.error.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.delete_outline,
                              size: AppIconSize.md,
                              color: AppColors.error,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
