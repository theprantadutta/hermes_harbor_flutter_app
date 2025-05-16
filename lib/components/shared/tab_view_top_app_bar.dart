import 'package:flutter/material.dart';

class TabViewTopAppBar extends StatelessWidget {
  final String title;

  const TabViewTopAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          const Icon(Icons.favorite_border, color: Colors.red),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
