import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../constants/setting_items.dart';

class AccountScreen extends StatelessWidget {
  static const kRouteName = '/account';
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = "John Doe";
    final userEmail = "johndoe@example.com";

    final kPrimaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.5,
      ),
      body: Column(
        children: [
          // Profile card
          Card(
            elevation: 0,
            color: Colors.grey.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: kPrimaryColor.withValues(alpha: 0.2),
                    // child: Icon(Icons.person, color: Colors.white, size: 32),
                    backgroundImage: const NetworkImage(
                      'https://i.pravatar.cc/150?img=2',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        userEmail,
                        style: const TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.1),

          const SizedBox(height: 24),

          // Action items
          Expanded(
            child: Column(
              children: settingItems
                  .map(
                    (item) => Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 22,
                              backgroundColor:
                                  kPrimaryColor.withValues(alpha: 0.1),
                              child: Icon(
                                item.icon,
                                color: kPrimaryColor,
                              ),
                            ),
                            title: Text(
                              item.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(item.subtitle),
                            trailing: const Icon(Icons.chevron_right),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: kPrimaryColor.withValues(alpha: 0.1),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            onTap: () {
                              context.push(item.route);
                            },
                          )
                              .animate()
                              .fadeIn(duration: 200.ms)
                              .slideY(begin: -0.1),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          // Logout button
          GestureDetector(
            onTap: () {
              // Handle logout
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: kPrimaryColor.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.logout, color: Colors.white),
                  SizedBox(width: 12),
                  Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: kBottomNavigationBarHeight + 35),
        ],
      ),
    );
  }
}
