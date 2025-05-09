import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  final List<Map<String, dynamic>> categories = const [
    {
      'name': 'Men',
      'image':
          'https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg',
      'color': Colors.blueAccent,
    },
    {
      'name': 'Women',
      'image':
          'https://images.pexels.com/photos/1036623/pexels-photo-1036623.jpeg',
      'color': Colors.pinkAccent,
    },
    {
      'name': 'Kids',
      'image':
          'https://images.pexels.com/photos/2079438/pexels-photo-2079438.jpeg',
      'color': Colors.amberAccent,
    },
    {
      'name': 'Electronics',
      'image':
          'https://images.pexels.com/photos/356056/pexels-photo-356056.jpeg',
      'color': Colors.purpleAccent,
    },
    {
      'name': 'Home',
      'image':
          'https://images.pexels.com/photos/584399/living-room-couch-interior-room-584399.jpeg',
      'color': Colors.greenAccent,
    },
    {
      'name': 'Sports',
      'image':
          'https://images.pexels.com/photos/863988/pexels-photo-863988.jpeg',
      'color': Colors.redAccent,
    },
    {
      'name': 'Beauty',
      'image':
          'https://images.pexels.com/photos/3373739/pexels-photo-3373739.jpeg',
      'color': Colors.tealAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      separatorBuilder: (context, index) => const SizedBox(width: 16),
      itemBuilder: (context, index) {
        final category = categories[index];
        return Animate(
          effects: [
            FadeEffect(duration: 300.ms),
            SlideEffect(
              begin: const Offset(0.2, 0),
              end: Offset.zero,
              curve: Curves.easeOutQuart,
              delay: (100 * index).ms,
            ),
          ],
          child: CategoryItem(category: category),
        );
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Map<String, dynamic> category;
  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Circular container with image and color overlay
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (category['color'] as Color).withValues(alpha: 0.2),
            border: Border.all(
              color: (category['color'] as Color).withValues(alpha: 0.3),
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: category['image'],
                fit: BoxFit.cover,
                color: Colors.black.withValues(alpha: 0.4),
                colorBlendMode: BlendMode.multiply,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          category['name'],
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
