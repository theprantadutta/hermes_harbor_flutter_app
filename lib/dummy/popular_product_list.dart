import 'package:flutter/material.dart';

import '../components/home/home_screen_categories.dart';
import '../models/product.dart';

final popularProducts = [
  Product(
    id: 'prod_keyboard_011',
    name: 'KeyFlex Wireless Keyboard',
    description: ''' ## Product Features

- Tactile low-profile keys
- Dual connectivity (Bluetooth + 2.4GHz)
- Rechargeable battery with 2-week life

[See keycap layout](https://example.com)

![Product Detail](https://images.pexels.com/photos/209151/pexels-photo-209151.jpeg)
''',
    price: 69.99,
    rating: 4.9,
    images: [
      'https://images.pexels.com/photos/209151/pexels-photo-209151.jpeg',
    ],
    availableColors: [Colors.white, Colors.grey],
    brand: 'KeyFlex',
    features: [
      'Multi-device Switching',
      'Mac & Windows Compatible',
      'Silent Typing',
    ],
    category: categories[3].name,
    reviewCount: 310,
    isFavorite: true,
    createdAt: DateTime(2025, 2, 22),
    tags: ['keyboard', 'wireless', 'tech'],
    specifications: {
      'Connection': 'Bluetooth 5.1 / 2.4GHz',
      'Battery Life': 'Up to 14 days',
      'Compatibility': 'Windows, macOS, Android, iOS',
    },
  ),
  Product(
    id: 'prod_chair_012',
    name: 'ErgoMax Mesh Chair',
    description: ''' ## Product Features

- Adjustable lumbar support
- Breathable mesh back
- Recline and tilt lock

[Assembly guide](https://example.com)

![Product Detail](https://images.pexels.com/photos/1444416/pexels-photo-1444416.jpeg)
''',
    price: 149.99,
    rating: 4.7,
    images: [
      'https://images.pexels.com/photos/1444416/pexels-photo-1444416.jpeg',
    ],
    availableColors: [Colors.black, Colors.blueGrey],
    brand: 'ErgoMax',
    features: [
      'Ergonomic Design',
      'Height Adjustment',
      'Wheels for Carpet & Hard Floor',
    ],
    category: categories[2].name,
    reviewCount: 214,
    isFavorite: false,
    createdAt: DateTime(2025, 1, 14),
    tags: ['ergonomic', 'chair', 'office'],
    specifications: {
      'Material': 'Mesh + Metal Frame',
      'Weight Limit': '250 lbs',
      'Adjustments': 'Seat height, tilt, armrest',
    },
  ),
  Product(
    id: 'prod_lamp_013',
    name: 'GlowLite Smart Desk Lamp',
    description: ''' ## Product Features

- 3 color temperatures + dimmer
- USB charging port built-in
- Auto shut-off timer

[Light modes demo](https://example.com)

![Product Detail](https://images.pexels.com/photos/1793035/pexels-photo-1793035.jpeg)
''',
    price: 34.99,
    rating: 4.8,
    images: [
      'https://images.pexels.com/photos/1793035/pexels-photo-1793035.jpeg',
    ],
    availableColors: [Colors.white, Colors.black],
    brand: 'GlowLite',
    features: [
      'Touch Controls',
      'Memory Function',
      'Energy Efficient LED',
    ],
    category: categories[4].name,
    reviewCount: 180,
    isFavorite: true,
    createdAt: DateTime(2025, 3, 6),
    tags: ['lamp', 'smart', 'lighting'],
    specifications: {
      'Power': '6W LED',
      'Color Temps': 'Warm, Neutral, Cool',
      'Charging': '5V USB-A output',
    },
  ),
];
