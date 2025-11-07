import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hermes_harbor_flutter_app/screen_arguments/view_all_screen_arguments.dart';

import '../../constants/colors.dart';
import '../../constants/design_tokens.dart';
import '../../screens/view_all_screen.dart';

const List<CategoryModel> categories = [
  CategoryModel(
    name: 'Men',
    image: 'https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg',
    color: Color(0xFF3A7BD5), // Gradient blue
    icon: Icons.style,
  ),
  CategoryModel(
    name: 'Women',
    image: 'https://images.pexels.com/photos/1036623/pexels-photo-1036623.jpeg',
    color: Color(0xFFC6426E), // Gradient pink
    icon: Icons.diamond,
  ),
  CategoryModel(
    name: 'Luxury',
    image: 'https://images.pexels.com/photos/934070/pexels-photo-934070.jpeg',
    color: Color(0xFFf7971e), // Gradient gold
    icon: Icons.workspace_premium,
  ),
  CategoryModel(
    name: 'Electronics',
    image: 'https://images.pexels.com/photos/356056/pexels-photo-356056.jpeg',
    color: Color(0xFF4776E6), // Gradient purple
    icon: Icons.bolt,
  ),
  CategoryModel(
    name: 'Home',
    image:
        'https://images.pexels.com/photos/584399/living-room-couch-interior-room-584399.jpeg',
    color: Color(0xFF00b09b), // Gradient teal
    icon: Icons.king_bed,
  ),
];

class HomeScreenCategories extends StatelessWidget {
  const HomeScreenCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.base),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Explore Collections',
                style: AppTextStyle.headingLarge(
                  color: isDarkTheme ? Colors.white : Colors.black87,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.push(ViewAllScreen.kRouteName);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor,
                ),
                child: Text(
                  'See All',
                  style: AppTextStyle.labelLarge(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.base),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.22,
            child: const PremiumCategoriesView(),
          ),
        ],
      ),
    );
  }
}

class PremiumCategoriesView extends StatelessWidget {
  const PremiumCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: categories.length,
      separatorBuilder: (context, index) => SizedBox(width: AppSpacing.xs + 1),
      itemBuilder: (context, index) {
        final category = categories[index];
        return Animate(
          effects: [
            FadeEffect(duration: AppDuration.slow),
            SlideEffect(
              begin: const Offset(0.3, 0),
              curve: AppCurves.luxury,
              delay: Duration(milliseconds: 150 * index),
            ),
          ],
          child: PremiumCategoryCard(category: category),
        );
      },
    );
  }
}

class PremiumCategoryCard extends StatefulWidget {
  final CategoryModel category;
  const PremiumCategoryCard({super.key, required this.category});

  @override
  State<PremiumCategoryCard> createState() => _PremiumCategoryCardState();
}

class _PremiumCategoryCardState extends State<PremiumCategoryCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        context.push(
          ViewAllScreen.kRouteName,
          extra: ViewAllScreenArguments(
            category: widget.category.name,
          ),
        );
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: AppDuration.fast,
        curve: AppCurves.spring,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.35,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: AppRadius.xlRadius,
              boxShadow: AppElevation.medium(Colors.black),
            ),
            child: Stack(
              children: [
                // Gradient background
                Container(
                  decoration: BoxDecoration(
                    borderRadius: AppRadius.xlRadius,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        widget.category.color.withValues(alpha: 0.9),
                        widget.category.color.withValues(alpha: 0.6),
                      ],
                    ),
                  ),
                ),

                // Image with vignette
                ClipRRect(
                  borderRadius: AppRadius.xlRadius,
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.transparent],
                      ).createShader(
                        Rect.fromLTRB(
                          0,
                          0,
                          rect.width,
                          rect.height,
                        ),
                      );
                    },
                    blendMode: BlendMode.dstIn,
                    child: CachedNetworkImage(
                      imageUrl: widget.category.image,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
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

                // Content
                Padding(
                  padding: EdgeInsets.all(AppSpacing.xs + 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Icon with glow effect
                      Container(
                        padding: EdgeInsets.all(AppSpacing.sm),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.25),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withValues(alpha: 0.3),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Icon(
                          widget.category.icon,
                          color: Colors.white,
                          size: AppIconSize.md,
                        ),
                      ),

                      // Category name
                      Text(
                        widget.category.name.toUpperCase(),
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: AppTextSize.md,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                          shadows: [
                            Shadow(
                              color: Colors.black.withValues(alpha: 0.4),
                              blurRadius: 6,
                              offset: const Offset(2, 2),
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

// Model class for type safety
class CategoryModel {
  final String name;
  final String image;
  final Color color;
  final IconData icon;

  const CategoryModel({
    required this.name,
    required this.image,
    required this.color,
    required this.icon,
  });
}
