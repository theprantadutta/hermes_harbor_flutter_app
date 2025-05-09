import 'package:flutter/material.dart';

class HomeScreenTopBar extends StatelessWidget {
  const HomeScreenTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final kPrimaryColor = Theme.of(context).primaryColor;
    return Row(
      children: [
        // Logo and Search Field (Expanded to take available space)
        Expanded(
          child: Row(
            children: [
              // Logo (fixed width)
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.black.withValues(alpha: 0.2),
                child: Image.asset(
                  'assets/hermes_harbor_small_logo_transparent_light.png',
                  fit: BoxFit.contain,
                  height: 35,
                ),
              ),
              const SizedBox(width: 10),
              // Search Field (takes remaining space)
              Expanded(
                child: Container(
                  // padding: EdgeInsets.only(top: 5.0),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Hermes Harbor',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black.withValues(alpha: 0.2),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
