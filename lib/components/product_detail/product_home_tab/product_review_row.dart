import 'package:flutter/material.dart';

class ProductReviewRow extends StatelessWidget {
  const ProductReviewRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text('H&M'),
            SizedBox(width: 10),
            Icon(Icons.star_border_outlined),
            Text('4.7'),
            Text('(105)'),
          ],
        ),
        Icon(Icons.favorite_outline_rounded),
      ],
    );
  }
}
