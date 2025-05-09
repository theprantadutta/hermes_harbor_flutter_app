import 'package:flutter/material.dart';

class ProductsFilter extends StatelessWidget {
  const ProductsFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final kPrimaryColor = Theme.of(context).primaryColor;
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.06,
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: index == 10 ? 0 : 5),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: kPrimaryColor.withValues(alpha: 0.2)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              children: [
                Text('Price'),
                Icon(
                  Icons.currency_pound_outlined,
                  size: 15,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
