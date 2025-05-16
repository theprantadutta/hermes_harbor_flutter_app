import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hermes_harbor_flutter_app/screen_arguments/view_all_screen_arguments.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Explore Collections',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
              ),
              TextButton(
                onPressed: () {
                  context.push(ViewAllScreen.kRouteName);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor,
                ),
                child: const Text('See All'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height:
                MediaQuery.sizeOf(context).height * 0.22, // Increased height
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
      separatorBuilder: (context, index) => const SizedBox(width: 5),
      itemBuilder: (context, index) {
        final category = categories[index];
        return Animate(
          effects: [
            FadeEffect(duration: 500.ms),
            SlideEffect(
              begin: const Offset(0.3, 0),
              curve: Curves.fastOutSlowIn,
              delay: (150 * index).ms,
            ),
          ],
          child: PremiumCategoryCard(category: category),
        );
      },
    );
  }
}

class PremiumCategoryCard extends StatelessWidget {
  final CategoryModel category;
  const PremiumCategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // _handleCategoryTap(context, category.name);
        context.push(
          ViewAllScreen.kRouteName,
          extra: ViewAllScreenArguments(
            category: category.name,
          ),
        );
      },
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.35,
        child: Card(
          // elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              // Gradient background
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      category.color.withValues(alpha: 0.8),
                      category.color.withValues(alpha: 0.4),
                    ],
                  ),
                ),
              ),

              // Image with vignette
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
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
                    imageUrl: category.image,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Icon
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        category.icon,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),

                    // Category name
                    Text(
                      category.name.toUpperCase(),
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                        shadows: [
                          Shadow(
                            color: Colors.black.withValues(alpha: 0.3),
                            blurRadius: 4,
                            offset: const Offset(1, 1),
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
