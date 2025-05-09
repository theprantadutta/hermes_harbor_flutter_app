import 'package:flutter/material.dart';

import '../models/product.dart';

final trendingNowProducts = [
  Product(
    id: 'prod_mouse_021',
    name: 'SwiftGlide Pro Mouse',
    description: ''' ## Product Features

- Ultra-light design (58g)
- Customizable DPI up to 16000
- RGB underglow lighting

[Watch unboxing](https://example.com)

![Product Detail](https://images.pexels.com/photos/356056/pexels-photo-356056.jpeg)
''',
    price: 54.99,
    rating: 4.6,
    images: [
      'https://images.pexels.com/photos/356056/pexels-photo-356056.jpeg',
    ],
    availableColors: [Colors.black, Colors.redAccent],
    brand: 'SwiftTech',
    features: [
      'Omron Switches',
      'Wired/Wireless Dual Mode',
      'RGB Sync with Software',
    ],
    category: 'Mouse',
    reviewCount: 127,
    isFavorite: false,
    createdAt: DateTime(2025, 3, 18),
    tags: ['gaming', 'mouse', 'rgb'],
    specifications: {
      'Sensor': 'PixArt 3370',
      'Weight': '58g',
      'Polling Rate': '1000Hz',
    },
  ),
  Product(
    id: 'prod_speaker_022',
    name: 'BoomBox Mini Speaker',
    description: ''' ## Product Features

- 360° surround sound
- 12-hour battery life
- Water-resistant (IPX6)

[See it in action](https://example.com)

![Product Detail](https://images.pexels.com/photos/63703/pexels-photo-63703.jpeg)
''',
    price: 39.99,
    rating: 4.8,
    images: [
      'https://images.pexels.com/photos/63703/pexels-photo-63703.jpeg',
    ],
    availableColors: [Colors.blue, Colors.green, Colors.black],
    brand: 'SoundCore',
    features: [
      'Bluetooth 5.2',
      'Built-in Microphone',
      'TWS Pairing',
    ],
    category: 'Audio',
    reviewCount: 203,
    isFavorite: true,
    createdAt: DateTime(2025, 2, 12),
    tags: ['speaker', 'bluetooth', 'portable'],
    specifications: {
      'Output Power': '20W',
      'Battery Life': '12 hrs',
      'Water Resistance': 'IPX6',
    },
  ),
  Product(
    id: 'prod_stand_023',
    name: 'AdjustPro Laptop Stand',
    description: ''' ## Product Features

- Height & angle adjustable
- Ventilated aluminum body
- Holds up to 17" laptops

[Setup Guide](https://example.com)

![Product Detail](https://images.pexels.com/photos/18105/pexels-photo.jpg)
''',
    price: 29.99,
    rating: 4.5,
    images: [
      'https://images.pexels.com/photos/18105/pexels-photo.jpg',
    ],
    availableColors: [Colors.grey, Colors.black],
    brand: 'AdjustPro',
    features: [
      'Foldable for Portability',
      'Anti-Slip Silicone Pads',
      'Improves Posture',
    ],
    category: 'Accessories',
    reviewCount: 142,
    isFavorite: true,
    createdAt: DateTime(2025, 3, 1),
    tags: ['laptop', 'stand', 'ergonomic'],
    specifications: {
      'Material': 'Aluminum Alloy',
      'Max Load': '8 kg',
      'Adjustability': 'Up to 7 angles',
    },
  ),
];
