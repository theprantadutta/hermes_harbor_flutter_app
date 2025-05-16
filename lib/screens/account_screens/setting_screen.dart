import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../components/accounts/account_screens_app_bar.dart';
import '../../components/layouts/main_layout.dart';
import 'address_screen.dart';
import 'my_orders_screen.dart';
import 'payment_methods_screen.dart';

class SettingScreen extends StatefulWidget {
  static const kRouteName = '/setting';
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  bool _biometricAuthEnabled = false;
  String _selectedLanguage = 'English';
  String _selectedCurrency = 'USD (\$)';

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: CustomScrollView(
        slivers: [
          AccountScreensAppBar(title: 'Settings'),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildUserProfileSection(context),
                const SizedBox(height: 24),
                _buildAppSettingsSection(context),
                const SizedBox(height: 24),
                _buildAccountSection(context),
                const SizedBox(height: 24),
                _buildSupportSection(context),
                const SizedBox(height: 16),
                _buildLogoutButton(context),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserProfileSection(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: ListTile(
        leading: const CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=2'),
        ),
        title: Text(
          'John Doe',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text('john.doe@example.com'),
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            // Navigate to edit profile
          },
        ),
      ),
    );
  }

  Widget _buildAppSettingsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'APP SETTINGS',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).hintColor,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              SwitchListTile(
                title: const Text('Dark Mode'),
                value: _darkModeEnabled,
                onChanged: (value) {
                  setState(() {
                    _darkModeEnabled = value;
                    // Implement theme change
                  });
                },
              ),
              const Divider(height: 1),
              SwitchListTile(
                title: const Text('Notifications'),
                value: _notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
              const Divider(height: 1),
              SwitchListTile(
                title: const Text('Biometric Authentication'),
                value: _biometricAuthEnabled,
                onChanged: (value) {
                  setState(() {
                    _biometricAuthEnabled = value;
                  });
                },
              ),
              const Divider(height: 1),
              ListTile(
                title: const Text('Language'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _selectedLanguage,
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
                onTap: () {
                  _showLanguagePicker(context);
                },
              ),
              const Divider(height: 1),
              ListTile(
                title: const Text('Currency'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _selectedCurrency,
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
                onTap: () {
                  _showCurrencyPicker(context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAccountSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ACCOUNT',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).hintColor,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.payment),
                title: const Text('Payment Methods'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  context.push(PaymentMethodsScreen.kRouteName);
                },
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Shipping Addresses'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  context.push(AddressScreen.kRouteName);
                },
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.shopping_bag),
                title: const Text('Order History'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  context.push(MyOrdersScreen.kRouteName);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSupportSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SUPPORT',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).hintColor,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Help Center'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Open help center
                },
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Contact Us'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Open contact form
                },
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.privacy_tip),
                title: const Text('Privacy Policy'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Open privacy policy
                },
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.description),
                title: const Text('Terms of Service'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Open terms of service
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        _showLogoutConfirmation(context);
      },
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        side: BorderSide(color: Colors.red),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        'LOG OUT',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _showLanguagePicker(BuildContext context) {
    final languages = ['English', 'Spanish', 'French', 'German', 'Japanese'];

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select Language',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ...languages.map((language) => ListTile(
                    title: Text(language),
                    trailing: _selectedLanguage == language
                        ? const Icon(Icons.check, color: Colors.green)
                        : null,
                    onTap: () {
                      setState(() {
                        _selectedLanguage = language;
                      });
                      Navigator.pop(context);
                    },
                  )),
            ],
          ),
        );
      },
    );
  }

  void _showCurrencyPicker(BuildContext context) {
    final currencies = {
      'USD (\$)': 'US Dollar',
      'EUR (€)': 'Euro',
      'GBP (£)': 'British Pound',
      'JPY (¥)': 'Japanese Yen',
    };

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select Currency',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ...currencies.entries.map((entry) => ListTile(
                    title: Text(entry.value),
                    subtitle: Text(entry.key),
                    trailing: _selectedCurrency == entry.key
                        ? const Icon(Icons.check, color: Colors.green)
                        : null,
                    onTap: () {
                      setState(() {
                        _selectedCurrency = entry.key;
                      });
                      Navigator.pop(context);
                    },
                  )),
            ],
          ),
        );
      },
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Log Out'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {
                // Perform logout
                Navigator.pop(context);
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text(
                'LOG OUT',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
