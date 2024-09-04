import 'package:flutter/material.dart';

class HomeScreenTopBar extends StatelessWidget {
  const HomeScreenTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final kPrimaryColor = Theme.of(context).primaryColor;
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.06,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          // color: kPrimaryColor.withOpacity(0.05),
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/hermes_harbor_small_logo_transparent.png',
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 5),
              Text(
                'Hermes Harbor',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                color: kPrimaryColor,
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.notifications_active_outlined,
                color: kPrimaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
