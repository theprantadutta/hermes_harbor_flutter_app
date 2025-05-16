import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/accounts/account_screens_app_bar.dart';
import '../components/layouts/main_layout.dart';
import '../models/address.dart';
import '../models/cart.dart';
import '../models/order.dart';
import '../riverpods/cart_list_provider.dart';
import 'account_screens/address_screen.dart';
import 'account_screens/payment_methods_screen.dart';
import 'order_confirmation_screen.dart';

class CheckoutScreen extends ConsumerWidget {
  static const kRouteName = '/checkout';

  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartListProvider);
    final totalPrice = ref.read(cartListProvider.notifier).getTotalCartValue();
    final kPrimaryColor = Theme.of(context).primaryColor;
    return MainLayout(
      body: CustomScrollView(
        slivers: [
          AccountScreensAppBar(title: 'Checkout'),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  // Order Summary Section
                  _buildSectionHeader(context, 'Order Summary'),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      children: [
                        ...cartItems
                            .map((item) => _buildCartItem(context, item)),
                        const Divider(height: 1),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '\$${totalPrice.toStringAsFixed(2)}',
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Shipping Address Section
                  _buildSectionHeader(context, 'Shipping Information'),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade200),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.location_on_outlined),
                      title: const Text('Home Address'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('123 Fashion Street, Apt 4B'),
                          const Text('New York, NY 10001'),
                          const Text('United States'),
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: () => _editAddress(context),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: kPrimaryColor.withValues(alpha: 0.7),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  'Change Address',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Payment Method Section
                  _buildSectionHeader(context, 'Payment Method'),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade200),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.credit_card),
                      title: const Text('Visa •••• 4242'),
                      subtitle: const Text('Expires 04/25'),
                      // trailing: OutlinedButton(
                      //   onPressed: () => _changePaymentMethod(context),
                      //   child: const Text('Change'),
                      // ),
                      trailing: GestureDetector(
                        onTap: () => _changePaymentMethod(context),
                        child: Container(
                          width: 80,
                          height: 50,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: kPrimaryColor.withValues(alpha: 0.7),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Change',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Place Order Button
                  GestureDetector(
                    onTap: () => _placeOrder(ref, context),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: kPrimaryColor.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'PLACE ORDER',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).hintColor,
          letterSpacing: 1.1,
        ),
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, Cart item) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: item.product.images.first,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'Qty: ${item.quantity}',
                  style: TextStyle(color: Theme.of(context).hintColor),
                ),
              ],
            ),
          ),

          // Price
          Text(
            '\$${item.totalPrice.toStringAsFixed(2)}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  void _editAddress(BuildContext context) {
    context.push(AddressScreen.kRouteName);
  }

  void _changePaymentMethod(BuildContext context) {
    context.push(PaymentMethodsScreen.kRouteName);
  }

  void _placeOrder(WidgetRef ref, BuildContext context) {
    final cartItems = ref.read(cartListProvider);
    final totalPrice = ref.read(cartListProvider.notifier).getTotalCartValue();

    // Create new order
    final newOrder = Order(
      id: 'ORD-${DateTime.now().millisecondsSinceEpoch}',
      orderDate: DateTime.now(),
      deliveryDate: DateTime.now().add(const Duration(days: 5)),
      totalAmount: totalPrice,
      status: 'Processing',
      products: cartItems.map((cart) => cart.product).toList(),
      trackingNumber:
          'TRK${Random().nextInt(999999999).toString().padLeft(9, '0')}',
      paymentMethod: 'Credit Card',
      deliveryAddress: Address(
        street: '123 Fashion Street',
        city: 'New York',
        state: 'NY',
        zipCode: '10001',
        country: 'USA',
      ),
    );

    // Clear cart and show confirmation
    ref.read(cartListProvider.notifier).clearCart();

    context.push(
      OrderConfirmationScreen.kRouteName,
      extra: newOrder,
    );
  }
}
