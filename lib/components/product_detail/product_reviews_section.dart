import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hermes_harbor_flutter_app/models/product_review.dart';

import 'review_card.dart';

class ProductReviewsSection extends StatelessWidget {
  final double averageRating;
  final int reviewCount;
  final List<ProductReview> reviews;

  const ProductReviewsSection({
    super.key,
    required this.averageRating,
    required this.reviewCount,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'REVIEWS',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.5,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$averageRating ⭐ ($reviewCount)',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () => _showAllReviews(context),
                child: Text(
                  'SEE ALL',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Featured reviews
          ...reviews.take(5).map((review) => ReviewCard(review: review)),

          // Divider if there are more reviews
          if (reviewCount > 2) ...[
            const SizedBox(height: 16),
            const Divider(height: 1),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () => _showAllReviews(context),
                child: Text(
                  'View all $reviewCount reviews',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showAllReviews(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => AllReviewsScreen(
    //       averageRating: averageRating,
    //       reviews: reviews,
    //     ),
    //   ),
    // );
  }
}
