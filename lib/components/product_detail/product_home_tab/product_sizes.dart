import 'package:flutter/material.dart';

class ProductSizes extends StatelessWidget {
  const ProductSizes({super.key});

  @override
  Widget build(BuildContext context) {
    final kPrimaryColor = Theme.of(context).primaryColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sizes',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (context, index) {
              return Container(
                width: 40,
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text('XL'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
