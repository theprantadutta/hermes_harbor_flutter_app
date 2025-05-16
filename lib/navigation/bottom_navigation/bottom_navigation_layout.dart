import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../constants/selectors.dart';
import 'floating_cart_button.dart';
import 'nav_item.dart';
import 'top_level_pages.dart';

class BottomNavigationLayout extends StatefulWidget {
  const BottomNavigationLayout({
    super.key,
  });

  @override
  State<BottomNavigationLayout> createState() => _BottomNavigationLayoutState();

  // ignore: library_private_types_in_public_api
  static _BottomNavigationLayoutState of(BuildContext context) =>
      context.findAncestorStateOfType<_BottomNavigationLayoutState>()!;
}

class _BottomNavigationLayoutState extends State<BottomNavigationLayout> {
  int selectedIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: selectedIndex,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _updateCurrentPageIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
    // pageController.animateToPage(
    //   index,
    //   duration: const Duration(milliseconds: 400),
    //   curve: Curves.easeInOut,
    // );
  }

  // void _handlePageViewChanged(int currentPageIndex) {
  //   setState(() {
  //     selectedIndex = currentPageIndex;
  //   });
  // }

  gotoPage(int index) {
    if (index < kTopLevelPages.length && index >= 0) {
      _updateCurrentPageIndex(index);
      // _handleIconPress(index);
    }
  }

  gotoNextPage() {
    if (selectedIndex != kTopLevelPages.length - 1) {
      _updateCurrentPageIndex(selectedIndex + 1);
      // _handleIconPress(selectedIndex + 1);
    }
  }

  gotoPreviousPage() {
    if (selectedIndex != 0) {
      _updateCurrentPageIndex(selectedIndex - 1);
      // _handleIconPress(selectedIndex - 1);
    }
  }

  // _handleIconPress(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //   });
  //   widget.navigationShell.goBranch(
  //     index,
  //     initialLocation: index == widget.navigationShell.currentIndex,
  //   );
  // }

  Future<bool> _onWillPop(BuildContext context) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit the app?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () =>
                    // Exit the app
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
                // FlutterExitApp.exitApp(),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        true;
  }

  Future<bool> _onBackButtonPressed() async {
    debugPrint('Back button Pressed');
    if (selectedIndex == 0) {
      // Exit the app
      debugPrint('Existing the app as we are on top level page');
      return await _onWillPop(context);
    } else {
      // Go back
      debugPrint('Going back to previous page');
      gotoPreviousPage();
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final kPrimaryColor = Theme.of(context).primaryColor;
    return BackButtonListener(
      onBackButtonPressed: _onBackButtonPressed,
      child: Scaffold(
        extendBodyBehindAppBar: false,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            AnnotatedRegion(
              value: getDefaultSystemUiStyle(isDarkTheme),
              child: kTopLevelPages[selectedIndex],
            ),
            // kDebugMode
            //     ? Positioned(
            //         bottom: kBottomNavigationBarHeight + 40,
            //         right: 10,
            //         child: const FloatingThemeChangeButton())
            //     : SizedBox(),
          ],
        ),
        extendBody: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Animate(
          effects: [
            SlideEffect(
              begin: const Offset(0, 1),
              duration: 800.ms,
              curve: Curves.fastOutSlowIn,
            ),
            FadeEffect(duration: 800.ms),
          ],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: PhysicalModel(
              borderRadius: BorderRadius.circular(24),
              color: kPrimaryColor.withValues(alpha: 0.5),
              elevation: 8,
              shadowColor: kPrimaryColor.withValues(alpha: 0.3),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: getDefaultGradient(
                    Colors.white,
                    Colors.white.withValues(alpha: 0.96),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NavItem(
                      icon: Icons.home_outlined,
                      selectedIcon: Icons.home_rounded,
                      label: "Home",
                      isActive: selectedIndex == 0,
                      onTap: () => _updateCurrentPageIndex(0),
                    ),
                    NavItem(
                      icon: Icons.favorite_outline,
                      selectedIcon: Icons.favorite_rounded,
                      label: "Wishlist",
                      isActive: selectedIndex == 1,
                      onTap: () => _updateCurrentPageIndex(1),
                    ),
                    FloatingCartButton(
                      isActive: selectedIndex == 2,
                      onTap: () => _updateCurrentPageIndex(2),
                    ),
                    NavItem(
                      icon: Icons.person_2_outlined,
                      selectedIcon: Icons.person_2_rounded,
                      label: "Account",
                      isActive: selectedIndex == 3,
                      onTap: () => _updateCurrentPageIndex(3),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
