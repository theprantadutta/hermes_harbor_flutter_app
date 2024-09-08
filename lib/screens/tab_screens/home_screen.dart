import 'package:flutter/material.dart';
import 'package:hermes_harbor_flutter_app/components/home/home_screen_categories.dart';
import 'package:hermes_harbor_flutter_app/components/home/home_screen_top_bar.dart';
import 'package:hermes_harbor_flutter_app/components/shared/cached_image_view.dart';

import '../../components/shared/horizontal_product_view.dart';

class HomeScreen extends StatelessWidget {
  static const kRouteName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HomeScreenTopBar(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: CachedImageView(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                imageUrl:
                    'https://images.pexels.com/photos/135620/pexels-photo-135620.jpeg?cs=srgb&dl=pexels-shattha-pilabut-38930-135620.jpg&fm=jpg&w=1280&h=884',
              ),
            ),
            const HomeScreenCategories(),
            // Curated For you
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: HorizontalProductView(
                title: 'Curated for you',
              ),
            ),
            // Popular Products
            const HorizontalProductView(
              title: 'Popular Products',
            ),
          ],
        ),
      ),
    );
  }
}
