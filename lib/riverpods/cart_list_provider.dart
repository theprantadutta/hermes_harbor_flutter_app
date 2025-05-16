import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/cart.dart';

part '../generated/riverpods/cart_list_provider.g.dart';

@Riverpod(keepAlive: true)
class CartList extends _$CartList {
  @override
  List<Cart> build() {
    return [];
  }

  void addToCart(Cart cart) {
    final index = state.indexWhere((c) => c.product.id == cart.product.id);
    if (index != -1) {
      // Product already in cart, update quantity and totalPrice
      final existing = state[index];
      final updatedCart = Cart(
        id: existing.id,
        product: existing.product,
        quantity: existing.quantity + cart.quantity,
        totalPrice: existing.totalPrice + cart.totalPrice,
      );
      state = [
        ...state.sublist(0, index),
        updatedCart,
        ...state.sublist(index + 1),
      ];
    } else {
      // New product, add to cart
      state = [...state, cart];
    }
  }

  void removeFromCart(Cart cart) {
    final index = state.indexWhere((c) => c.product.id == cart.product.id);
    if (index != -1) {
      final existing = state[index];

      if (existing.quantity > cart.quantity) {
        final updatedCart = Cart(
          id: existing.id,
          product: existing.product,
          quantity: existing.quantity - cart.quantity,
          totalPrice: existing.totalPrice - cart.totalPrice,
        );
        state = [
          ...state.sublist(0, index),
          updatedCart,
          ...state.sublist(index + 1),
        ];
      } else {
        // Quantity is less than or equal → remove item entirely
        state = state.where((c) => c.product.id != cart.product.id).toList();
      }
    }
  }

  void incrementQuantity(String productId) {
    final index = state.indexWhere((c) => c.product.id == productId);
    if (index != -1) {
      final existing = state[index];
      final updatedCart = Cart(
        id: existing.id,
        product: existing.product,
        quantity: existing.quantity + 1,
        totalPrice: existing.totalPrice + existing.product.price,
      );
      state = [
        ...state.sublist(0, index),
        updatedCart,
        ...state.sublist(index + 1),
      ];
    }
  }

  void decrementQuantity(String productId) {
    final index = state.indexWhere((c) => c.product.id == productId);
    if (index != -1) {
      final existing = state[index];

      if (existing.quantity > 1) {
        final updatedCart = Cart(
          id: existing.id,
          product: existing.product,
          quantity: existing.quantity - 1,
          totalPrice: existing.totalPrice - existing.product.price,
        );
        state = [
          ...state.sublist(0, index),
          updatedCart,
          ...state.sublist(index + 1),
        ];
      } else {
        // If quantity is 1, remove the item entirely
        state = state.where((c) => c.product.id != productId).toList();
      }
    }
  }

  void clearCart() {
    state = [];
  }

  double getTotalCartValue() {
    double total = 0.0;
    for (var cart in state) {
      total += cart.totalPrice;
    }
    return total;
  }
}
