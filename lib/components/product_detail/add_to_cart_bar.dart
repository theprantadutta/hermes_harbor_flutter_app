import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart' as flutter_animate;
import 'package:google_fonts/google_fonts.dart';

class AddToCartBar extends StatelessWidget {
  final int quantity;
  final VoidCallback increment;
  final VoidCallback decrement;
  final VoidCallback addToCart;

  const AddToCartBar({
    super.key,
    required this.quantity,
    required this.increment,
    required this.decrement,
    required this.addToCart,
  });

  @override
  Widget build(BuildContext context) {
    return flutter_animate.Animate(
      effects: const [
        flutter_animate.FadeEffect(),
        flutter_animate.SlideEffect(begin: Offset(0, 1))
      ],
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          children: [
            // --- Wishlist Button ---
            IconButton(
              icon: const Icon(Icons.favorite_border, size: 28),
              onPressed: () {
                // Add to wishlist logic
              },
            ),
            const SizedBox(width: 8),

            // --- Quantity Selector ---
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[200]!),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: decrement,
                  ),
                  Text(
                    quantity.toString(),
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: increment,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),

            // --- Add to Cart Button ---
            Expanded(
              child: GestureDetector(
                onTap: addToCart,
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'ADD TO CART',
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
