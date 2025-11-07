import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../constants/animations.dart';
import '../../constants/design_tokens.dart';
import '../../screens/view_all_screen.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    final kPrimaryColor = Theme.of(context).primaryColor;
    return Center(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(AppSpacing.xxl),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    kPrimaryColor.withValues(alpha: 0.1),
                    kPrimaryColor.withValues(alpha: 0.05),
                  ],
                ),
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 80,
                color: kPrimaryColor.withValues(alpha: 0.6),
              ),
            )
                .animate(
                  onPlay: (controller) => controller.repeat(reverse: true),
                )
                .fadeIn(duration: AppDuration.slower)
                .scale(
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1.0, 1.0),
                  duration: AppDuration.slower,
                  curve: AppCurves.luxury,
                )
                .then()
                .scale(
                  begin: const Offset(1.0, 1.0),
                  end: const Offset(1.05, 1.05),
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.easeInOut,
                ),

            SizedBox(height: AppSpacing.xl),

            // Title
            Text(
              "Your Fashion Haven Awaits!",
              style: AppTextStyle.headingLarge(),
              textAlign: TextAlign.center,
            )
                .animate()
                .fadeIn(
                  duration: AppDuration.slow,
                  delay: Duration(milliseconds: 200),
                )
                .slideY(
                  begin: 0.3,
                  duration: AppDuration.slow,
                  curve: AppCurves.luxury,
                ),

            SizedBox(height: AppSpacing.sm),

            // Subtitle
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxl + 8),
              child: Text(
                "Your cart is currently empty. Discover our premium collection and fill it with luxury items you'll love.",
                style: AppTextStyle.bodyMedium(
                  color: Theme.of(context).hintColor,
                ),
                textAlign: TextAlign.center,
              ),
            )
                .animate()
                .fadeIn(
                  duration: AppDuration.slow,
                  delay: Duration(milliseconds: 400),
                )
                .slideY(
                  begin: 0.3,
                  duration: AppDuration.slow,
                  curve: AppCurves.luxury,
                ),

            SizedBox(height: AppSpacing.xl),

            // Action buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => context.push(ViewAllScreen.kRouteName),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            kPrimaryColor.withValues(alpha: 0.8),
                            kPrimaryColor,
                          ],
                        ),
                        borderRadius: AppRadius.mdRadius,
                        boxShadow: AppElevation.medium(kPrimaryColor),
                      ),
                      child: Center(
                        child: Text(
                          'SHOP NEW ARRIVALS',
                          style: AppTextStyle.button(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(
                        duration: AppDuration.slow,
                        delay: Duration(milliseconds: 600),
                      )
                      .slideY(
                        begin: 0.3,
                        duration: AppDuration.slow,
                        curve: AppCurves.luxury,
                      ),
                  SizedBox(height: AppSpacing.md),
                  GestureDetector(
                    onTap: () => context.push(ViewAllScreen.kRouteName),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: AppRadius.mdRadius,
                        border: Border.all(
                          color: kPrimaryColor.withValues(alpha: 0.3),
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'VIEW YOUR WISHLIST',
                          style: AppTextStyle.button(
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(
                        duration: AppDuration.slow,
                        delay: Duration(milliseconds: 800),
                      )
                      .slideY(
                        begin: 0.3,
                        duration: AppDuration.slow,
                        curve: AppCurves.luxury,
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
