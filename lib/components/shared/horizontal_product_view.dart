import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hermes_harbor_flutter_app/components/shared/section_title_with_see_all.dart';

import 'single_product_view.dart';

class HorizontalProductView extends StatelessWidget {
  final String title;
  const HorizontalProductView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          SectionTitleWithSeeAll(title: title),
          const SizedBox(height: 15),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.32,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => FadeInUp(
                from: index * 50,
                child: SingleProductView(
                  index: index,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
