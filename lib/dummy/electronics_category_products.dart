import 'package:flutter/material.dart';

import '../components/home/home_screen_categories.dart';
import '../models/product.dart';

final List<Product> electronicsCategoryProducts = [
  Product(
    id: 'elec1',
    name: 'iPhone 15 Pro Max',
    description: 'Apple’s latest beast with a titanium body and A17 chip.',
    price: 1399.99,
    images: [
      'https://images.pexels.com/photos/13424681/pexels-photo-13424681.jpeg',
    ],
    rating: 4.9,
    isFavorite: true,
    tags: ['smartphone', 'apple', 'electronics'],
    availableColors: [Colors.grey, Colors.black],
    brand: 'Apple',
    category: categories[3].name,
    features: ['Dynamic Island', '48MP Camera', 'USB-C Charging'],
    reviewCount: 125,
    createdAt: DateTime(2025, 1, 10),
  ),
  Product(
    id: 'elec2',
    name: 'Samsung 8K QLED TV',
    description: 'Immersive 8K visuals with smart features for any room.',
    price: 2999.99,
    images: [
      'https://images.pexels.com/photos/5211580/pexels-photo-5211580.jpeg',
    ],
    rating: 4.8,
    isFavorite: false,
    tags: ['tv', 'samsung', 'entertainment'],
    availableColors: [Colors.black],
    brand: 'Samsung',
    category: categories[3].name,
    features: ['8K Resolution', 'Smart Hub', 'HDMI 2.1'],
    reviewCount: 89,
    createdAt: DateTime(2025, 2, 5),
  ),
  Product(
    id: 'elec3',
    name: 'Sony WH-1000XM6',
    description: 'Flagship noise-cancelling headphones with crisp audio.',
    price: 499.99,
    images: [
      'https://images.pexels.com/photos/788946/pexels-photo-788946.jpeg',
    ],
    rating: 4.7,
    isFavorite: true,
    tags: ['headphones', 'sony', 'audio'],
    availableColors: [Colors.black, Colors.blueGrey],
    brand: 'Sony',
    category: categories[3].name,
    features: ['ANC', '30h Battery', 'Quick Charge'],
    reviewCount: 71,
    createdAt: DateTime(2025, 3, 18),
  ),
];
