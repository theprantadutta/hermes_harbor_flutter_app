import 'package:flutter/material.dart';
import 'package:hermes_harbor_flutter_app/components/home/home_screen_top_bar.dart';

class HomeScreen extends StatelessWidget {
  static const kRouteName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          HomeScreenTopBar(),
        ],
      ),
    );
  }
}
