import 'package:flutter/material.dart';

import '../components/home/home_screen_categories.dart';
import '../models/product.dart';

final List<Product> luxuryCategoryProducts = [
  Product(
    id: 'lux1',
    name: 'Rolex Submariner',
    description: 'An iconic timepiece built for precision and status.',
    price: 10999.99,
    images: [
      'https://images.pexels.com/photos/190819/pexels-photo-190819.jpeg',
    ],
    rating: 4.9,
    isFavorite: true,
    tags: ['watch', 'luxury', 'rolex'],
    availableColors: [Colors.black, Colors.cyan],
    brand: 'Rolex',
    category: categories[2].name,
    features: ['Automatic Movement', 'Water Resistant', 'Ceramic Bezel'],
    reviewCount: 88,
    createdAt: DateTime(2025, 1, 1),
  ),
  Product(
    id: 'lux2',
    name: 'Gucci Leather Bag',
    description: 'Premium leather handbag with the signature Gucci flair.',
    price: 2499.99,
    images: [
      'https://images.pexels.com/photos/1488463/pexels-photo-1488463.jpeg',
    ],
    rating: 4.8,
    isFavorite: false,
    tags: ['handbag', 'leather', 'gucci'],
    availableColors: [Colors.brown, Colors.black],
    brand: 'Gucci',
    category: categories[2].name,
    features: ['Genuine Leather', 'Magnetic Flap', 'Iconic Branding'],
    reviewCount: 56,
    createdAt: DateTime(2025, 2, 14),
  ),
  Product(
    id: 'lux3',
    name: 'Louis Vuitton Trunk',
    description: 'Timeless trunk for elegant travel or decor.',
    price: 14500.00,
    images: [
      'https://images.pexels.com/photos/4210866/pexels-photo-4210866.jpeg',
    ],
    rating: 5.0,
    isFavorite: true,
    tags: ['trunk', 'lv', 'luxury'],
    availableColors: [Colors.brown],
    brand: 'Louis Vuitton',
    category: categories[2].name,
    features: ['Brass Lock', 'Leather Handles', 'Canvas Exterior'],
    reviewCount: 22,
    createdAt: DateTime(2025, 3, 30),
  ),
];
