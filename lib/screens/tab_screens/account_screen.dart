import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SettingItem {
  final String title;
  final String subtitle;
  final IconData icon;

  SettingItem({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

class AccountScreen extends StatelessWidget {
  static const kRouteName = '/account';
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = "John Doe";
    final userEmail = "johndoe@example.com";

    final List<SettingItem> items = [
      SettingItem(
        title: 'My Orders',
        subtitle: 'View and manage your orders',
        icon: Icons.shopping_bag_outlined,
      ),
      SettingItem(
        title: 'Payment Methods',
        subtitle: 'Manage your payment methods',
        icon: Icons.payment,
      ),
      SettingItem(
        title: 'Addresses',
        subtitle: 'Manage your shipping and billing addresses',
        icon: Icons.location_on_outlined,
      ),
      SettingItem(
        title: 'Settings',
        subtitle: 'Manage your account settings',
        icon: Icons.settings_outlined,
      ),
      SettingItem(
        title: 'Help & Support',
        subtitle: 'Get help and support',
        icon: Icons.help_outline,
      ),
    ];

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
                    child: Icon(Icons.person, color: Colors.white, size: 32),
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
              children: items
                  .map(
                    (item) => Expanded(
                      child: Center(
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundColor:
                                kPrimaryColor.withValues(alpha: 0.2),
                            child: Icon(
                              item.icon,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(item.title),
                          subtitle: Text(item.title),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            // You can handle navigation here
                          },
                        )
                            .animate()
                            .fadeIn(duration: 200.ms)
                            .slideY(begin: -0.1),
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
