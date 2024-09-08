import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../shared/floating_theme_change_button.dart';

class MainLayout extends StatelessWidget {
  final Widget body;

  const MainLayout({
    super.key,
    required this.body,
  });

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    if (context.canPop()) context.pop();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AnnotatedRegion(
        value: isDarkTheme
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        child: BackButtonListener(
          onBackButtonPressed: () => _onBackButtonPressed(context),
          child: body,
        ),
      ),
      floatingActionButton: kReleaseMode
          ? null // Don't show FloatingActionButton in release (production) mode
          : const FloatingThemeChangeButton(),
    );
  }
}
