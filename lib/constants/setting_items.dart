import 'package:flutter/material.dart';
import '../screens/account_screens/help_and_support_screen.dart';
import '../screens/account_screens/payment_methods_screen.dart';
import '../screens/account_screens/setting_screen.dart';

import '../models/setting_item.dart';
import '../screens/account_screens/address_screen.dart';
import '../screens/account_screens/my_orders_screen.dart';

final List<SettingItem> settingItems = [
  SettingItem(
    title: 'My Orders',
    subtitle: 'View and manage your orders',
    icon: Icons.shopping_bag_outlined,
    route: MyOrdersScreen.kRouteName,
  ),
  SettingItem(
    title: 'Payment Methods',
    subtitle: 'Manage your payment methods',
    icon: Icons.payment,
    route: PaymentMethodsScreen.kRouteName,
  ),
  SettingItem(
    title: 'Addresses',
    subtitle: 'Manage your addresses',
    icon: Icons.location_on_outlined,
    route: AddressScreen.kRouteName,
  ),
  SettingItem(
    title: 'Settings',
    subtitle: 'Manage your account settings',
    icon: Icons.settings_outlined,
    route: SettingScreen.kRouteName,
  ),
  SettingItem(
    title: 'Help & Support',
    subtitle: 'Get help and support',
    icon: Icons.help_outline,
    route: HelpAndSupportScreen.kRouteName,
  ),
];
