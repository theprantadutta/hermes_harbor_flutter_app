import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/selectors.dart';
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
                    _NavItem(
                      icon: Icons.home_outlined,
                      selectedIcon: Icons.home_rounded,
                      label: "Home",
                      isActive: selectedIndex == 0,
                      onTap: () => _updateCurrentPageIndex(0),
                    ),
                    _NavItem(
                      icon: Icons.favorite_outline,
                      selectedIcon: Icons.favorite_rounded,
                      label: "Wishlist",
                      isActive: selectedIndex == 1,
                      onTap: () => _updateCurrentPageIndex(1),
                    ),
                    _FloatingCartButton(
                      isActive: selectedIndex == 2,
                      onTap: () => _updateCurrentPageIndex(2),
                    ),
                    _NavItem(
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

// Custom Nav Item Widget
class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final kPrimaryColor = Theme.of(context).primaryColor;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: 300.ms,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isActive
              ? kPrimaryColor.withValues(alpha: 0.15)
              : Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? selectedIcon : icon,
              size: 20,
              color: isActive ? kPrimaryColor : Colors.grey[600],
            ),
            Text(
              label,
              style: GoogleFonts.raleway(
                fontSize: 12,
                fontWeight: isActive ? FontWeight.w800 : FontWeight.w600,
                color: isActive ? kPrimaryColor : Colors.grey[600],
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Floating Cart Button Widget
class _FloatingCartButton extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;

  const _FloatingCartButton({
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final kPrimaryColor = Theme.of(context).primaryColor;
    return GestureDetector(
      onTap: onTap,
      child: Animate(
        effects: [ScaleEffect(duration: 300.ms)],
        child: Container(
          width: 56,
          height: 56,
          margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isActive
                  ? [kPrimaryColor, kPrimaryColor.withValues(alpha: 0.8)]
                  : [Colors.grey[800]!, Colors.grey[600]!],
            ),
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor.withValues(alpha: isActive ? 0.4 : 0.1),
                blurRadius: 12,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Badge(
              // label: Text('3'), // Uncomment for cart count
              backgroundColor: Colors.white,
              textColor: kPrimaryColor,
              child: Icon(
                isActive
                    ? Icons.shopping_bag_rounded
                    : Icons.shopping_bag_outlined,
                color: Colors.white,
                size: 26,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
