import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const kDefaultFlexTheme = FlexScheme.orangeM3;

LinearGradient getDefaultGradient(Color mainHelper, Color helperColor) =>
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [0.1, 0.9],
      colors: [
        mainHelper,
        helperColor,
      ],
    );

SystemUiOverlayStyle getDefaultSystemUiStyle(bool isDarkTheme) {
  return SystemUiOverlayStyle(
    // Status bar color
    statusBarColor: Colors.transparent,
    // Status bar brightness (optional)
    statusBarIconBrightness: isDarkTheme
        ? Brightness.light
        : Brightness.dark, // For Android (dark icons)
    statusBarBrightness: isDarkTheme
        ? Brightness.dark
        : Brightness.light, // For iOS (dark icons)
  );
}

final kDefaultLightUiStyle = SystemUiOverlayStyle(
  // Status bar color
  statusBarColor: Colors.transparent,
  // Status bar brightness (optional)
  statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
  statusBarBrightness: Brightness.light, // For iOS (dark icons)
);

final kDefaultDarkUiStyle = SystemUiOverlayStyle(
  // Status bar color
  statusBarColor: Colors.transparent,
  // Status bar brightness (optional)
  statusBarIconBrightness: Brightness.light, // For Android (dark icons)
  statusBarBrightness: Brightness.dark, // For iOS (dark icons)
);
