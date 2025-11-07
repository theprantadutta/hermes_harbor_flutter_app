import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../constants/animations.dart';
import '../../constants/design_tokens.dart';
import '../../screens/view_all_screen.dart';

class EmptyWishlist extends StatelessWidget {
  const EmptyWishlist({super.key});

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
                    Colors.red.withOpacity(0.1),
                    Colors.pink.withOpacity(0.05),
                  ],
                ),
              ),
              child: Icon(
                Icons.favorite_border_rounded,
                size: 80,
                color: Colors.red.withOpacity(0.6),
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
              "Your Wishlist is Waiting!",
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
                "Save your favorite luxury items here. When you see something you love, tap the heart icon to add it here.",
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
                            kPrimaryColor.withOpacity(0.8),
                            kPrimaryColor,
                          ],
                        ),
                        borderRadius: AppRadius.mdRadius,
                        boxShadow: AppElevation.medium(kPrimaryColor),
                      ),
                      child: Center(
                        child: Text(
                          'BROWSE COLLECTIONS',
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
                          color: kPrimaryColor.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'VIEW YOUR CART',
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
