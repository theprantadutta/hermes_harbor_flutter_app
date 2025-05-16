import 'package:hermes_harbor_flutter_app/models/product.dart';

class Cart {
  final String id;
  final Product product;
  final int quantity;
  final double totalPrice;

  Cart({
    required this.id,
    required this.product,
    required this.quantity,
    required this.totalPrice,
  });

  Cart copyWith({
    String? id,
    Product? product,
    int? quantity,
    double? totalPrice,
  }) {
    return Cart(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
