import 'package:flutter/material.dart';
import 'package:hermes_harbor_flutter_app/components/shared/cached_image_view.dart';
import 'package:hermes_harbor_flutter_app/components/shared/section_title_with_see_all.dart';

class HomeScreenCategories extends StatelessWidget {
  const HomeScreenCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionTitleWithSeeAll(title: 'Shop by Category'),
          const SizedBox(height: 5),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.12,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    right: index == 9 ? 0 : 3,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CachedImageView(
                        width: 60,
                        height: 60,
                        boxShape: BoxShape.circle,
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        imageUrl:
                            'https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg?cs=srgb&dl=pexels-chloekalaartist-1043474.jpg&fm=jpg&w=640&h=910',
                      ),
                      Text('Mens'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
