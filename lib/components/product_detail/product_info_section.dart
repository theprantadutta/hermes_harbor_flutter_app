import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart' as flutter_animate;
import 'package:google_fonts/google_fonts.dart';

class ProductInfoSection extends StatelessWidget {
  final String title;
  final double price;
  final double rating;
  final List<Color> availableColors;
  final String brand;

  const ProductInfoSection({
    super.key,
    required this.title,
    required this.price,
    required this.rating,
    required this.availableColors,
    this.brand = 'HERMES HARBOR',
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Brand Tag ---
          flutter_animate.Animate(
            effects: [flutter_animate.FadeEffect(delay: 150.ms)],
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: theme.primaryColor.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                brand.toUpperCase(),
                style: GoogleFonts.raleway(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.8,
                  color: theme.primaryColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // --- Luxury Title ---
          flutter_animate.Animate(
            effects: [
              flutter_animate.FadeEffect(delay: 200.ms),
              flutter_animate.SlideEffect(
                begin: const Offset(0, 0.1),
                curve: Curves.easeOutCubic,
              )
            ],
            child: Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                height: 1.25,
                color: Colors.black87,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 4),

          // --- Price with Currency ---
          flutter_animate.Animate(
            effects: [flutter_animate.FadeEffect(delay: 250.ms)],
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '\$',
                    style: GoogleFonts.raleway(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: theme.primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: price.toStringAsFixed(2),
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),

          // --- Rating & Actions Row ---
          flutter_animate.Animate(
            effects: [flutter_animate.FadeEffect(delay: 300.ms)],
            child: Row(
              children: [
                // Rating Chip
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.amber.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.amber.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star_rounded,
                          color: Colors.amber[700], size: 18),
                      const SizedBox(width: 6),
                      Text(
                        '$rating (142)',
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Action Buttons
                _buildIconButton(
                  context: context,
                  icon: Icons.share_outlined,
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                _buildIconButton(
                  context: context,
                  icon: Icons.favorite_border,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // --- Color Selection ---
          flutter_animate.Animate(
            effects: [flutter_animate.FadeEffect(delay: 350.ms)],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SELECT COLOR',
                  style: GoogleFonts.raleway(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: availableColors.map((color) {
                    return _ColorChip(
                      color: color,
                      isSelected: color == availableColors.first,
                      onSelected: () => () {},
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(
      {required BuildContext context,
      required IconData icon,
      required VoidCallback onPressed}) {
    final kPrimaryColor = Theme.of(context).primaryColor;
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: kPrimaryColor.withValues(alpha: 0.2)),
        color: kPrimaryColor.withValues(alpha: 0.05),
      ),
      child: IconButton(
        icon: Icon(icon, size: 20),
        onPressed: onPressed,
        splashRadius: 20,
        color: kPrimaryColor,
      ),
    );
  }
}

class _ColorChip extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onSelected;

  const _ColorChip({
    required this.color,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: AnimatedContainer(
        duration: 300.ms,
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                )
              : Border.all(color: Colors.grey[200]!, width: 1),
        ),
        child: isSelected
            ? const Center(
                child: Icon(Icons.check, size: 18, color: Colors.white),
              )
            : null,
      ),
    );
  }
}
