import '../dummy/popular_product_list.dart';

import '../models/address.dart';
import '../models/order.dart';
import 'electronics_category_products.dart';
import 'home_category_products.dart';
import 'luxury_category_products.dart';

final List<Order> myOrders = [
  Order(
    id: '#123456',
    orderDate: DateTime.now().subtract(const Duration(days: 2)),
    deliveryDate: DateTime.now().add(const Duration(days: 5)),
    totalAmount: 249.99,
    status: 'Shipped',
    products: popularProducts.take(3).toList(),
    trackingNumber: 'TRK789456123',
    paymentMethod: 'Credit Card',
    deliveryAddress: Address(
      street: '123 Fashion St',
      city: 'New York',
      state: 'NY',
      zipCode: '10001',
      country: 'USA',
    ),
  ),
  Order(
    id: '#123457',
    orderDate: DateTime.now().subtract(const Duration(days: 10)),
    deliveryDate: DateTime.now().subtract(const Duration(days: 2)),
    totalAmount: 1399.99,
    status: 'Delivered',
    products: electronicsCategoryProducts.take(1).toList(),
    trackingNumber: 'TRK123456789',
    paymentMethod: 'PayPal',
    deliveryAddress: Address(
      street: '456 Silicon Blvd',
      city: 'San Francisco',
      state: 'CA',
      zipCode: '94105',
      country: 'USA',
    ),
  ),
  Order(
    id: '#123458',
    orderDate: DateTime.now().subtract(const Duration(days: 1)),
    deliveryDate: DateTime.now().add(const Duration(days: 3)),
    totalAmount: 89.99,
    status: 'Processing',
    products: homeCategoryProducts.skip(1).take(2).toList(),
    trackingNumber: 'TRK456789123',
    paymentMethod: 'Apple Pay',
    deliveryAddress: Address(
      street: '789 Cozy Ln',
      city: 'Chicago',
      state: 'IL',
      zipCode: '60601',
      country: 'USA',
    ),
  ),
  Order(
    id: '#123459',
    orderDate: DateTime.now().subtract(const Duration(days: 15)),
    deliveryDate: DateTime.now().subtract(const Duration(days: 8)),
    totalAmount: 24500.00,
    status: 'Delivered',
    products: luxuryCategoryProducts.toList(),
    trackingNumber: 'TRK987654321',
    paymentMethod: 'Bank Transfer',
    deliveryAddress: Address(
      street: '999 Luxe Ave',
      city: 'Beverly Hills',
      state: 'CA',
      zipCode: '90210',
      country: 'USA',
    ),
  ),
  Order(
    id: '#123460',
    orderDate: DateTime.now().subtract(const Duration(days: 3)),
    deliveryDate: DateTime.now().add(const Duration(days: 7)),
    totalAmount: 649.50,
    status: 'Awaiting Shipment',
    products: [
      ...popularProducts.take(1),
      ...electronicsCategoryProducts.skip(2).take(1),
    ],
    trackingNumber: 'TRK321654987',
    paymentMethod: 'Cash on Delivery',
    deliveryAddress: Address(
      street: '321 Chill Rd',
      city: 'Austin',
      state: 'TX',
      zipCode: '73301',
      country: 'USA',
    ),
  ),
];
