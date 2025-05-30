import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hermes_harbor_flutter_app/models/order.dart';
import 'package:hermes_harbor_flutter_app/screen_arguments/view_all_screen_arguments.dart';
import 'package:hermes_harbor_flutter_app/screens/account_screens/address_screen.dart';
import 'package:hermes_harbor_flutter_app/screens/account_screens/my_orders_screen.dart';
import 'package:hermes_harbor_flutter_app/screens/product_detail_screen.dart';
import 'package:hermes_harbor_flutter_app/screens/tab_screens/account_screen.dart';
import 'package:hermes_harbor_flutter_app/screens/tab_screens/wishlist_screen.dart';
import 'package:hermes_harbor_flutter_app/screens/view_all_screen.dart';

import '../screen_arguments/product_detail_screen_arguments.dart';
import '../screens/account_screens/help_and_support_screen.dart';
import '../screens/account_screens/payment_methods_screen.dart';
import '../screens/account_screens/setting_screen.dart';
import '../screens/checkout_screen.dart';
import '../screens/login_screen.dart';
import '../screens/order_confirmation_screen.dart';
import '../screens/tab_screens/cart_screen.dart';
import '../screens/tab_screens/home_screen.dart';
import 'bottom_navigation/bottom_navigation_layout.dart';

class AppNavigation {
  AppNavigation._();

  static String initial = "/home";
  // static String initial = LoginScreen.route;
  // static String initial = OnBoardingScreen.route;

  // Private navigators
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _shellNavigatorWishlist =
      GlobalKey<NavigatorState>(debugLabel: 'shellWishlist');
  static final _shellNavigatorCart =
      GlobalKey<NavigatorState>(debugLabel: 'shellCart');
  static final _shellNavigatorAccount =
      GlobalKey<NavigatorState>(debugLabel: 'shellAccount');

  // GoRouter configuration
  static final GoRouter router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    routes: [
      // /// OnBoardingScreen
      // GoRoute(
      //   parentNavigatorKey: rootNavigatorKey,
      //   path: OnBoardingScreen.route,
      //   name: "OnBoarding",
      //   builder: (context, state) => OnBoardingScreen(
      //     key: state.pageKey,
      //   ),
      // ),

      // /// OnBoardingThemeScreen
      // GoRoute(
      //   parentNavigatorKey: rootNavigatorKey,
      //   path: OnboardingThemeScreen.route,
      //   name: "OnBoardingTheme",
      //   builder: (context, state) => OnboardingThemeScreen(
      //     key: state.pageKey,
      //   ),
      // ),

      /// LoginScreen
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: LoginScreen.kRouteName,
        name: "Login",
        builder: (context, state) => LoginScreen(
          key: state.pageKey,
        ),
        // redirect: (context, state) async {
        //   // Check if the onboarding screen was shown
        //   final prefs = await SharedPreferences.getInstance();
        //   final onboardingShown = prefs.getBool('onboardingShown') ?? false;
        //   debugPrint('Onboarding Shown: $onboardingShown');
        //   if (!onboardingShown) {
        //     await prefs.setBool('onboardingShown', true);
        //     return OnBoardingScreen.route;
        //   }

        //   // If the user is not logged in, they need to login
        //   final loggedIn = await IsarService().isLoginSessionValid();
        //   debugPrint('Is Login Session Valid: $loggedIn');
        //   final loggingIn = state.fullPath == LoginScreen.route;

        //   if (!loggedIn) return loggingIn ? null : LoginScreen.route;

        //   // If the user is logged in but still on the login page, send them to the home page
        //   if (loggingIn) return HomeScreen.route;

        //   // No need to redirect at all
        //   return null;
        // },
      ),

      // /// RegisterScreen
      // GoRoute(
      //   parentNavigatorKey: rootNavigatorKey,
      //   path: RegisterScreen.route,
      //   name: "Register",
      //   builder: (context, state) => RegisterScreen(
      //     key: state.pageKey,
      //   ),
      // ),

      /// MainWrapper
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BottomNavigationLayout();
        },
        branches: <StatefulShellBranch>[
          /// Branch Home
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: HomeScreen.kRouteName,
                name: "Home",
                pageBuilder: (context, state) => reusableTransitionPage(
                  state: state,
                  child: const HomeScreen(),
                ),
              ),
            ],
          ),

          // StatefulShellBranch(
          //   navigatorKey: _shellNavigatorFavorites,
          //   routes: <RouteBase>[
          //     GoRoute(
          //       path: FavoritesScreen.kRouteName,
          //       name: "Favorites",
          //       pageBuilder: (context, state) => reusableTransitionPage(
          //         state: state,
          //         child: const FavoritesScreen(),
          //       ),
          //     ),
          //   ],
          // ),

          StatefulShellBranch(
            navigatorKey: _shellNavigatorWishlist,
            routes: <RouteBase>[
              GoRoute(
                path: WishlistScreen.kRouteName,
                name: "Wishlist",
                pageBuilder: (context, state) => reusableTransitionPage(
                  state: state,
                  child: const WishlistScreen(),
                ),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _shellNavigatorCart,
            routes: <RouteBase>[
              GoRoute(
                path: CartScreen.kRouteName,
                name: "Cart",
                pageBuilder: (context, state) => reusableTransitionPage(
                  state: state,
                  child: const CartScreen(),
                ),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _shellNavigatorAccount,
            routes: <RouteBase>[
              GoRoute(
                path: AccountScreen.kRouteName,
                name: "Account",
                pageBuilder: (context, state) => reusableTransitionPage(
                  state: state,
                  child: const AccountScreen(),
                ),
              ),
            ],
          ),
        ],
      ),

      /// View all Screen
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: ViewAllScreen.kRouteName,
        name: "View All",
        builder: (context, state) {
          final viewAllScreenArguments = state.extra as ViewAllScreenArguments?;
          return ViewAllScreen(
            key: state.pageKey,
            viewAllScreenArguments: viewAllScreenArguments,
          );
        },
      ),

      /// Product Detail Screen
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: ProductDetailScreen.kRouteName,
        name: "Product Detail",
        builder: (context, state) {
          final args = state.extra as ProductDetailScreenArguments;
          return ProductDetailScreen(
            key: state.pageKey,
            product: args.product,
          );
        },
      ),

      /// My Orders Screen
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MyOrdersScreen.kRouteName,
        name: "My Orders",
        builder: (context, state) {
          return MyOrdersScreen(
            key: state.pageKey,
          );
        },
      ),

      /// Payment Methods Screen
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: PaymentMethodsScreen.kRouteName,
        name: "Payment Methods",
        builder: (context, state) {
          return PaymentMethodsScreen(
            key: state.pageKey,
          );
        },
      ),

      /// Addresses Screen
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: AddressScreen.kRouteName,
        name: "Addresses",
        builder: (context, state) {
          return AddressScreen(
            key: state.pageKey,
          );
        },
      ),

      /// Setting Screen
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: SettingScreen.kRouteName,
        name: "Setting",
        builder: (context, state) {
          return SettingScreen(
            key: state.pageKey,
          );
        },
      ),

      /// Help & Support Screen
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: HelpAndSupportScreen.kRouteName,
        name: "Help & Support",
        builder: (context, state) {
          return HelpAndSupportScreen(
            key: state.pageKey,
          );
        },
      ),

      /// Checkout Screen
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: CheckoutScreen.kRouteName,
        name: "Checkout",
        builder: (context, state) {
          return CheckoutScreen(
            key: state.pageKey,
          );
        },
      ),

      /// OrderConfirmationScreen Screen
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: OrderConfirmationScreen.kRouteName,
        name: "Order Confirmation",
        builder: (context, state) {
          final args = state.extra as Order;
          return OrderConfirmationScreen(
            key: state.pageKey,
            order: args,
          );
        },
      ),

      // /// Notice Details
      // GoRoute(
      //   parentNavigatorKey: rootNavigatorKey,
      //   path: '${NoticeScreen.route}/:noticeId',
      //   name: "NoticeDetails",
      //   builder: (context, state) {
      //     final noticeId = state.pathParameters["noticeId"]!;
      //     return NoticeDetailScreen(
      //       key: state.pageKey,
      //       noticeId: noticeId,
      //     );
      //   },
      // ),
    ],
    // redirect: (context, state) async {
    //   // if the user is not logged in, they need to login
    //   final loggedIn = await IsarService().isLoginSessionValid();
    //   debugPrint('Is Login Session Valid: $loggedIn');
    //   final loggingIn = state.fullPath == LoginScreen.route;
    //   if (!loggedIn) return loggingIn ? null : LoginScreen.route;
    //   // if the user is logged in but still on the login page, send them to
    //   // the home page
    //   if (loggingIn) return HomeScreen.route;
    //   // no need to redirect at all
    //   return null;
    // },
    // redirect: (context, state) async {
    //   // Check if the onboarding screen was shown
    //   final prefs = await SharedPreferences.getInstance();
    //   final onboardingShown = prefs.getBool('onboardingShown') ?? false;
    //   debugPrint('Onboarding Shown: $onboardingShown');
    //   if (!onboardingShown) {
    //     await prefs.setBool('onboardingShown', true);
    //     return OnBoardingScreen.route;
    //   }

    //   // If the user is not logged in, they need to login
    //   final loggedIn = await IsarService().isLoginSessionValid();
    //   debugPrint('Is Login Session Valid: $loggedIn');
    //   final loggingIn = state.fullPath == LoginScreen.route;

    //   if (!loggedIn) return loggingIn ? null : LoginScreen.route;

    //   // If the user is logged in but still on the login page, send them to the home page
    //   if (loggingIn) return HomeScreen.route;

    //   // No need to redirect at all
    //   return null;
    // },
  );

  static CustomTransitionPage<void> reusableTransitionPage({
    required state,
    required Widget child,
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      restorationId: state.pageKey.value,
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
