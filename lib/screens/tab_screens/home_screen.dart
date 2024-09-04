import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const kRouteName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Screen'),
    );
  }
}
