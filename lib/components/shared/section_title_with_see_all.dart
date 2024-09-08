import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hermes_harbor_flutter_app/screens/view_all_screen.dart';

class SectionTitleWithSeeAll extends StatelessWidget {
  final String title;

  const SectionTitleWithSeeAll({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: () => context.push(ViewAllScreen.kRouteName),
          child: const Text(
            'See All',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
