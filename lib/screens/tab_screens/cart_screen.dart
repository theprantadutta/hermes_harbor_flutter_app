import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../components/cart/cart_item_card.dart';
import '../../components/cart/empty_cart.dart';
import '../../components/shared/tab_view_top_app_bar.dart';
import '../../models/cart.dart';
import '../../riverpods/cart_list_provider.dart';
import '../checkout_screen.dart';

class CartScreen extends ConsumerStatefulWidget {
  static const kRouteName = '/cart';
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  // List<Product> cartItems = List.from(popularProducts.take(3));

  void _removeItem(int index, Cart cart) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Remove Item"),
        content: const Text(
            "Are you sure you want to remove this item from your cart?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text("Cancel")),
          TextButton(
            onPressed: () {
              // setState(() => cartItems.removeAt(index));
              ref.read(cartListProvider.notifier).removeFromCart(cart);
              Navigator.pop(ctx);
            },
            child: const Text("Remove", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final kPrimaryColor = Theme.of(context).primaryColor;
    final cartItems = ref.watch(cartListProvider);
    double total = cartItems.fold(0, (sum, item) => sum + item.totalPrice);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TabViewTopAppBar(title: 'My Cart'),
            Expanded(
              child: cartItems.isEmpty
                  ? const EmptyCart()
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      itemCount: cartItems.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final cart = cartItems[index];
                        return CartItemCard(
                          cart: cart,
                          onDelete: () => _removeItem(index, cart),
                        ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.1);
                      },
                    ),
            ),

            // Bottom Summary
            if (cartItems.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border:
                      Border(top: BorderSide(color: Colors.grey, width: 0.15)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "${cartItems.length} item(s) • \$${total.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        context.push(CheckoutScreen.kRouteName);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(
              height: kBottomNavigationBarHeight + 25,
            ),
          ],
        ),
      ),
    );
  }
}
