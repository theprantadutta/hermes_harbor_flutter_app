import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../components/accounts/account_screens_app_bar.dart';
import '../components/layouts/main_layout.dart';
import '../models/order.dart';
import '../models/product.dart';
import 'account_screens/my_orders_screen.dart';
import 'tab_screens/home_screen.dart';

class OrderConfirmationScreen extends StatelessWidget {
  static const kRouteName = '/order-confirmation';

  final Order order;
  const OrderConfirmationScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MainLayout(
      body: CustomScrollView(
        slivers: [
          // App Bar
          AccountScreensAppBar(title: 'Order Confirmation'),

          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Success Confirmation
                Column(
                  children: [
                    Icon(
                      Icons.check_circle_rounded,
                      size: 80,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Thank You For Your Order!',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your payment has been processed successfully',
                      style: TextStyle(
                        color: theme.hintColor,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // Order Summary Card
                Card(
                  elevation: 0,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: Colors.grey.shade200,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildOrderDetailRow(
                          context: context,
                          icon: Icons.confirmation_number,
                          title: 'Order Number',
                          value: order.id,
                        ),
                        const Divider(height: 24),
                        _buildOrderDetailRow(
                          context: context,
                          icon: Icons.calendar_today,
                          title: 'Order Date',
                          value: DateFormat('MMM dd, yyyy - hh:mm a')
                              .format(order.orderDate),
                        ),
                        const Divider(height: 24),
                        _buildOrderDetailRow(
                          context: context,
                          icon: Icons.local_shipping,
                          title: 'Estimated Delivery',
                          value: DateFormat('MMM dd, yyyy')
                              .format(order.deliveryDate),
                        ),
                        const Divider(height: 24),
                        _buildOrderDetailRow(
                          context: context,
                          icon: Icons.payment,
                          title: 'Payment Method',
                          value: order.paymentMethod,
                        ),
                        const Divider(height: 24),
                        _buildOrderDetailRow(
                          context: context,
                          icon: Icons.attach_money,
                          title: 'Total Paid',
                          value: '\$${order.totalAmount.toStringAsFixed(2)}',
                          isTotal: true,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Tracking Info
                Card(
                  elevation: 0,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: Colors.grey.shade200,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.track_changes, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              'TRACK YOUR ORDER',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Tracking Number: ${order.trackingNumber}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // ElevatedButton.icon(
                        //   onPressed: () {
                        //     // Open tracking in browser
                        //     // launchUrl(Uri.parse('https://tracking.example.com/${order.trackingNumber}'));
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //       const SnackBar(
                        //         content: Text('Not Implemented Yet.'),
                        //       ),
                        //     );
                        //   },
                        //   icon: const Icon(Icons.open_in_new, size: 18),
                        //   label: const Text('Track Package'),
                        //   style: ElevatedButton.styleFrom(
                        //     minimumSize: const Size(double.infinity, 50),
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(12),
                        //     ),
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Not Implemented Yet.'),
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                              color: theme.primaryColor.withValues(alpha: 0.7),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Text(
                                'Track Package',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Order Items Preview
                Text(
                  'ORDER ITEMS (${order.products.length})',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: theme.hintColor,
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(height: 12),
                ...order.products
                    .map((product) => _buildOrderItem(context, product)),

                const SizedBox(height: 20),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () =>
                            context.pushReplacement(HomeScreen.kRouteName),
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: theme.primaryColor.withValues(alpha: 0.5),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              'Continue Shopping',
                              style: TextStyle(
                                color: theme.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => context.push(MyOrdersScreen.kRouteName),
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            color: theme.primaryColor.withValues(alpha: 0.7),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              'View Orders',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderDetailRow({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String value,
    bool isTotal = false,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).hintColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: isTotal ? 18 : 16,
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOrderItem(BuildContext context, Product product) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: product.images.first,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
