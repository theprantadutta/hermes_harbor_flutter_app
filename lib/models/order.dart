import 'address.dart';
import 'product.dart';

class Order {
  final String id;
  final DateTime orderDate;
  final DateTime deliveryDate;
  final double totalAmount;
  final String status; // 'Processing', 'Shipped', 'Delivered', 'Cancelled'
  final List<Product> products;
  final String trackingNumber;
  final String paymentMethod;
  final Address deliveryAddress;

  const Order({
    required this.id,
    required this.orderDate,
    required this.deliveryDate,
    required this.totalAmount,
    required this.status,
    required this.products,
    required this.trackingNumber,
    required this.paymentMethod,
    required this.deliveryAddress,
  });
}
