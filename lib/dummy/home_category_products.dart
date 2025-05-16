import 'package:flutter/material.dart';

import '../components/home/home_screen_categories.dart';
import '../models/product.dart';

final List<Product> homeCategoryProducts = [
  Product(
    id: 'home1',
    name: 'Air Purifier Pro',
    description: 'Breathe clean with a HEPA-certified smart purifier.',
    price: 349.99,
    images: [
      'https://images.pexels.com/photos/3951862/pexels-photo-3951862.jpeg',
    ],
    rating: 4.6,
    isFavorite: true,
    tags: ['air purifier', 'clean air', 'home'],
    availableColors: [Colors.white],
    brand: 'Dyson',
    category: categories[4].name,
    features: ['HEPA Filter', 'App Control', 'Quiet Mode'],
    reviewCount: 60,
    createdAt: DateTime(2025, 4, 7),
  ),
  Product(
    id: 'home2',
    name: 'Smart Diffuser Lamp',
    description: 'Aromatherapy and ambient lighting, now combined.',
    price: 129.99,
    images: [
      'https://images.pexels.com/photos/6862113/pexels-photo-6862113.jpeg',
    ],
    rating: 4.8,
    isFavorite: false,
    tags: ['diffuser', 'lamp', 'home'],
    availableColors: [Colors.white, Colors.orange],
    brand: 'Philips',
    category: categories[4].name,
    features: ['Aroma Dispenser', 'Dimmable Light', 'USB Rechargeable'],
    reviewCount: 42,
    createdAt: DateTime(2025, 3, 22),
  ),
  Product(
    id: 'home3',
    name: 'Minimalist Bookshelf',
    description: 'Open-shelf design perfect for books, plants, or decor.',
    price: 199.99,
    images: [
      'https://images.pexels.com/photos/32024218/pexels-photo-32024218.jpeg',
    ],
    rating: 4.7,
    isFavorite: true,
    tags: ['bookshelf', 'furniture', 'home'],
    availableColors: [Colors.white, Colors.brown],
    brand: 'IKEA',
    category: categories[4].name,
    features: ['Wooden Frame', 'Easy Assembly', 'Multi-Tier'],
    reviewCount: 34,
    createdAt: DateTime(2025, 2, 18),
  ),
];
