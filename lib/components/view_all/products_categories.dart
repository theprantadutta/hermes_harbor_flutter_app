import 'package:flutter/material.dart';
import 'package:hermes_harbor_flutter_app/components/home/home_screen_categories.dart'
    show CategoryModel;

// class ProductsCategories extends StatelessWidget {
//   final List<CategoryModel> categories;

//   const ProductsCategories({super.key, required this.categories});

//   @override
//   Widget build(BuildContext context) {
//     final kPrimaryColor = Theme.of(context).primaryColor;
//     return Expanded(
//       child: Container(
//         height: MediaQuery.sizeOf(context).height * 0.06,
//         width: MediaQuery.sizeOf(context).width,
//         margin: const EdgeInsets.symmetric(
//           vertical: 10,
//           horizontal: 10,
//         ),
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: 10,
//           itemBuilder: (context, index) {
//             return Container(
//               margin: EdgeInsets.only(right: index == 10 ? 0 : 5),
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               decoration: BoxDecoration(
//                 border: Border.all(color: kPrimaryColor.withValues(alpha: 0.2)),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: const Row(
//                 children: [
//                   Text('Men'),
//                   Icon(
//                     Icons.person_outlined,
//                     size: 15,
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

class ProductsCategories extends StatelessWidget {
  final List<CategoryModel> categories;
  const ProductsCategories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          return _CategoryItem(
            category: category,
            isDarkMode: isDarkMode,
          );
        },
      ),
    );
  }
}

class _CategoryItem extends StatefulWidget {
  final CategoryModel category;
  final bool isDarkMode;

  const _CategoryItem({
    required this.category,
    required this.isDarkMode,
  });

  @override
  State<_CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<_CategoryItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: widget.isDarkMode
                  ? Colors.grey[800]!
                  : Theme.of(context).primaryColor.withOpacity(0.1),
              width: 1.5,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.05),
                      blurRadius: 8,
                      spreadRadius: 1,
                      offset: const Offset(0, 2),
                    )
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  widget.category.icon,
                  size: 16,
                  color: _isHovered
                      ? Theme.of(context).primaryColor
                      : widget.isDarkMode
                          ? Colors.grey[400]
                          : Colors.grey[600],
                  key: ValueKey(_isHovered),
                ),
              ),
              const SizedBox(width: 8),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _isHovered
                      ? Theme.of(context).primaryColor
                      : widget.isDarkMode
                          ? Colors.grey[300]
                          : Colors.grey[700],
                ),
                child: Text(
                  widget.category.name.toUpperCase(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
