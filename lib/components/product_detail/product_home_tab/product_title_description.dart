import 'package:flutter/material.dart';

class ProductTitleDescription extends StatelessWidget {
  const ProductTitleDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Product Title',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        const Row(
          children: [
            Text(
              'Tk. 500',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 5),
            Text(
              'Tk. 600',
              style: TextStyle(
                fontSize: 13,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          'This is the product detail page. Here you can add more information about the product.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
