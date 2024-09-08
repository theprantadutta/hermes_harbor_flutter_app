import 'package:flutter/material.dart';
import 'package:hermes_harbor_flutter_app/components/shared/categories_view.dart';
import 'package:hermes_harbor_flutter_app/components/shared/section_title_with_see_all.dart';

class HomeScreenCategories extends StatelessWidget {
  const HomeScreenCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SectionTitleWithSeeAll(title: 'Shop by Category'),
          SizedBox(height: 5),
          CategoriesView(),
        ],
      ),
    );
  }
}
