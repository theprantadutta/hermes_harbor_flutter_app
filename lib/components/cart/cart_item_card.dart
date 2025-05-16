import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hermes_harbor_flutter_app/riverpods/cart_list_provider.dart';

import '../../models/cart.dart';
import 'quantity_button.dart';

class CartItemCard extends ConsumerWidget {
  final Cart cart;
  final VoidCallback onDelete;

  const CartItemCard({
    super.key,
    required this.cart,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                cart.product.images.first,
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
                        cart.product.name,
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
                  Text("\$${cart.product.price.toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      QuantityButton(
                          icon: Icons.remove,
                          onTap: () {
                            if (cart.quantity == 1) return;
                            ref
                                .read(cartListProvider.notifier)
                                .decrementQuantity(cart.product.id);
                          }),
                      const SizedBox(width: 8),
                      Text(
                        cart.quantity.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      QuantityButton(
                          icon: Icons.add,
                          onTap: () {
                            ref
                                .read(cartListProvider.notifier)
                                .incrementQuantity(cart.product.id);
                          }),
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
