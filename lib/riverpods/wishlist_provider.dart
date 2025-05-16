import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/product.dart';

part '../generated/riverpods/wishlist_provider.g.dart';

// @Riverpod(keepAlive: true)
// class Wishlist extends _$Wishlist {
//   @override
//   List<ProductWishlist> build() {
//     return [];
//   }

//   void addToWishlist(Product product) {
//     final exists = state.any((p) => p.product.id == product.id);
//     if (!exists) {
//       state = [
//         ...state,
//         ProductWishlist(product: product, isFavorite: true),
//       ];
//     }
//   }

//   void removeFromWishlist(Product product) {
//     state = state.where((p) => p.product.id != product.id).toList();
//   }

//   void toggleWishlist(Product product) {
//     final index = state.indexWhere((p) => p.product.id == product.id);
//     if (index != -1) {
//       // Flip the isFavorite flag
//       final updated = ProductWishlist(
//         product: product,
//         isFavorite: !state[index].isFavorite,
//       );
//       final newState = [...state];
//       newState[index] = updated;
//       state = newState;
//     } else {
//       // Not in wishlist yet? Add it
//       addToWishlist(product);
//     }
//   }

//   bool isInWishlist(Product product) {
//     return state.any((p) => p.product.id == product.id && p.isFavorite);
//   }
// }

@Riverpod(keepAlive: true)
class Wishlist extends _$Wishlist {
  @override
  List<Product> build() {
    return [];
  }

  void addToWishlist(Product product) {
    final exists = state.any((p) => p.id == product.id);
    if (!exists) {
      state = [...state, product];
    }
  }

  void removeFromWishlist(Product product) {
    state = state.where((p) => p.id != product.id).toList();
  }

  bool isInWishlist(Product product) {
    return state.any((p) => p.id == product.id);
  }
}
