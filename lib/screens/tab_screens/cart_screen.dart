import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:hermes_harbor_flutter_app/dummy/popular_product_lilst.dart';

import '../../models/product.dart';

class CartScreen extends StatefulWidget {
  static const kRouteName = '/cart';
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Product> cartItems = List.from(popularProducts.take(3));

  void _removeItem(int index) {
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
              setState(() => cartItems.removeAt(index));
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
    double total = cartItems.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Row(
          children: [
            Icon(Icons.shopping_cart_outlined, color: Colors.black87),
            SizedBox(width: 8),
            Text("My Cart", style: TextStyle(color: Colors.black87)),
          ],
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: cartItems.isEmpty
                ? const Center(child: Text("Your cart is empty 😢"))
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    itemCount: cartItems.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final product = cartItems[index];
                      return _CartItemCard(
                        product: product,
                        onDelete: () => _removeItem(index),
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
                      // Handle purchase
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
    );
  }
}

class _CartItemCard extends StatelessWidget {
  final Product product;
  final VoidCallback onDelete;

  const _CartItemCard({required this.product, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
              color: Colors.black12, blurRadius: 6, offset: const Offset(0, 2))
        ],
      ),
      child: Row(
        children: [
          // Image
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14),
                bottomLeft: Radius.circular(14),
              ),
              child: Image.network(
                product.images.first,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text("\$${product.price.toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _QuantityButton(icon: Icons.remove, onTap: () {}),
                      const SizedBox(width: 8),
                      const Text("1",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8),
                      _QuantityButton(icon: Icons.add, onTap: () {}),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.close,
                            size: 20, color: Colors.grey),
                        onPressed: onDelete,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QuantityButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }
}
