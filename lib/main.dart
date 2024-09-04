import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'navigation/app_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Hermes Harbor',
      routerConfig: AppNavigation.router,
      theme: FlexThemeData.light(
        scheme: FlexScheme.ebonyClay,
        useMaterial3: true,
        fontFamily: GoogleFonts.nunito().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.ebonyClay,
        useMaterial3: true,
        fontFamily: GoogleFonts.nunito().fontFamily,
      ).copyWith(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
