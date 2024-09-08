import 'package:flutter/material.dart';

import 'cached_image_view.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
