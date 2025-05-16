import 'package:flutter/material.dart';

import '../home/home_screen_categories.dart';

class ProductsCategories extends StatelessWidget {
  final List<CategoryModel> categories;
  final String selectedCategory;
  final Function(String category) onCategorySelected;

  const ProductsCategories({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

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
            isSelected: category.name == selectedCategory,
            onCategorySelected: onCategorySelected,
          );
        },
      ),
    );
  }
}

class _CategoryItem extends StatefulWidget {
  final CategoryModel category;
  final bool isDarkMode;
  final bool isSelected;
  final Function(String category) onCategorySelected;

  const _CategoryItem({
    required this.category,
    required this.isDarkMode,
    required this.isSelected,
    required this.onCategorySelected,
  });

  @override
  State<_CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<_CategoryItem> {
  @override
  Widget build(BuildContext context) {
    final kPrimaryColor = Theme.of(context).primaryColor;
    return GestureDetector(
      onTap: () {
        widget.onCategorySelected(widget.category.name);
      },
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: widget.isSelected ? kPrimaryColor : Colors.transparent,
            border: Border.all(color: kPrimaryColor.withValues(alpha: 0.2)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  widget.category.icon,
                  size: 16,
                  color: widget.isSelected ? Colors.white : kPrimaryColor,
                ),
              ),
              const SizedBox(width: 8),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: widget.isSelected ? Colors.white : kPrimaryColor,
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
