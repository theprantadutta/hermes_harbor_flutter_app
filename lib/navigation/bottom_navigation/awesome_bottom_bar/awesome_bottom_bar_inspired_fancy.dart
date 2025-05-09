import 'package:animate_do/animate_do.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';

class AwesomeBottomBarFancyBorderLayout extends StatefulWidget {
  final int selectedIndex;
  final Function(int) updateCurrentPageIndex;
  final StyleIconFooter styleIconFooter;

  const AwesomeBottomBarFancyBorderLayout({
    super.key,
    required this.selectedIndex,
    required this.updateCurrentPageIndex,
    this.styleIconFooter = StyleIconFooter.divider,
  });

  @override
  State<AwesomeBottomBarFancyBorderLayout> createState() =>
      _AwesomeBottomBarFancyBorderLayoutState();
}

class _AwesomeBottomBarFancyBorderLayoutState
    extends State<AwesomeBottomBarFancyBorderLayout> {
  @override
  Widget build(BuildContext context) {
    final kPrimaryColor = Theme.of(context).primaryColor;
    // final isDarkTheme = MyApp.of(context).isDarkMode;
    return FadeInUp(
      duration: const Duration(milliseconds: 500),
      child: BottomBarInspiredInside(
        backgroundColor: kPrimaryColor.withValues(alpha: 0.05),
        colorSelected: Colors.white,
        // color: isDarkTheme ? Colors.white : Colors.black,
        color: Colors.black,
        // borderRadius: BorderRadius.circular(50),
        iconSize: 20,
        onTap: widget.updateCurrentPageIndex,
        animated: true,
        indexSelected: widget.selectedIndex,
        // styleIconFooter: widget.styleIconFooter,
        itemStyle: ItemStyle.circle,
        chipStyle: ChipStyle(
          convexBridge: true,
          background: kPrimaryColor,
        ),
        radius: 20.0,
        pad: 2,
        items: const [
          TabItem(
            icon: Icons.home_outlined,
            // title: 'Home',
          ),
          TabItem(
            icon: Icons.favorite_outline,
            // title: 'Favourites',
          ),
          TabItem(
            icon: Icons.add_shopping_cart_outlined,
            // title: 'WishList',
          ),
          TabItem(
            icon: Icons.shopping_bag_outlined,
            // title: 'Cart',
          ),
          TabItem(
            icon: Icons.person_3_outlined,
            // title: 'Account',
          ),
        ],
      ),
    );
  }
}
