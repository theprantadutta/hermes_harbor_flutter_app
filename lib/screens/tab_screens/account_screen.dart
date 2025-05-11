import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AccountScreen extends StatelessWidget {
  static const kRouteName = '/account';
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = "John Doe";
    final userEmail = "johndoe@example.com";

    final items = [
      {'icon': Icons.shopping_bag_outlined, 'label': 'My Orders'},
      {'icon': Icons.favorite_outline, 'label': 'Wishlist'},
      {'icon': Icons.payment, 'label': 'Payment Methods'},
      {'icon': Icons.location_on_outlined, 'label': 'Addresses'},
      {'icon': Icons.settings_outlined, 'label': 'Settings'},
      {'icon': Icons.help_outline, 'label': 'Help & Support'},
    ];

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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.person, color: Colors.white, size: 32),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(userName,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Text(userEmail,
                          style: const TextStyle(color: Colors.black54)),
                    ],
                  )
                ],
              ),
            ),
          ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.1),

          const SizedBox(height: 24),

          // Action items
          ...items.map(
            (item) => ListTile(
              leading: Icon(item['icon'] as IconData),
              title: Text(item['label'] as String),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // You can handle navigation here
              },
            ).animate().fadeIn(duration: 200.ms).slideX(begin: -0.1),
          ),

          const Spacer(),

          // Logout button
          // ElevatedButton.icon(
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.black,
          //     foregroundColor: Colors.white,
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(10)),
          //     padding: const EdgeInsets.symmetric(vertical: 14),
          //   ),
          //   onPressed: () {
          //     // Handle logout
          //   },
          //   icon: const Icon(Icons.logout),
          //   label: const Text("Logout", style: TextStyle(fontSize: 16)),
          // ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.2),

          GestureDetector(
            onTap: () {
              // Handle logout
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.logout, color: Colors.white),
                  SizedBox(width: 12),
                  Text("Logout",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
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
