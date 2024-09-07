import 'package:flutter/material.dart';
import 'package:hermes_harbor_flutter_app/components/shared/cached_image_view.dart';
import 'package:hermes_harbor_flutter_app/components/shared/section_title_with_see_all.dart';

class HorizontalProductView extends StatelessWidget {
  const HorizontalProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          const SectionTitleWithSeeAll(title: 'Curated for you'),
          const SizedBox(height: 15),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedImageView(
                          height: MediaQuery.sizeOf(context).height * 0.3,
                          width: double.infinity,
                          imageUrl:
                              'https://images.pexels.com/photos/1861907/pexels-photo-1861907.jpeg?cs=srgb&dl=pexels-ronailson-1861907.jpg&fm=jpg&w=640&h=427'),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('H&M'),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(
                                  '4.8',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '(50)',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Product ${index + 1}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
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
