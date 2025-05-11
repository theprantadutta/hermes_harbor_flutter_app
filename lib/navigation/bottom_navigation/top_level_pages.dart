import 'package:flutter/material.dart';
import 'package:hermes_harbor_flutter_app/screens/tab_screens/account_screen.dart';
import 'package:hermes_harbor_flutter_app/screens/tab_screens/cart_screen.dart';
import 'package:hermes_harbor_flutter_app/screens/tab_screens/wishlist_screen.dart';

import '../../screens/tab_screens/home_screen.dart';

/// Top Level Pages
const List<Widget> kTopLevelPages = [
  HomeScreen(),
  // FavoritesScreen(),
  WishlistScreen(),
  CartScreen(),
  AccountScreen(),
];
