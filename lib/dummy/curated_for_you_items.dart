import 'package:flutter/material.dart';

import '../models/product.dart';

final curatedForYouProducts = [
  Product(
    id: 'prod_earfit_008',
    name: 'EarFit Mini ANC Buds',
    description: ''' ## Product Features

- Compact, lightweight design
- Active Noise Cancellation
- Up to 20h battery life with case

[More on sound tuning](https://example.com)

![Product Detail](https://images.pexels.com/photos/3394660/pexels-photo-3394660.jpeg)
''',
    price: 99.99,
    rating: 4.6,
    images: [
      'https://images.pexels.com/photos/3394660/pexels-photo-3394660.jpeg',
    ],
    availableColors: [Colors.pinkAccent, Colors.black],
    brand: 'SoundPod',
    features: [
      'ANC',
      'USB-C Fast Charging',
      'Auto Pairing',
    ],
    category: 'Audio',
    reviewCount: 120,
    isFavorite: false,
    createdAt: DateTime(2025, 3, 28),
    tags: ['audio', 'buds', 'compact'],
    specifications: {
      'Battery Life': '5h + 15h (Case)',
      'Bluetooth': '5.2',
      'Water Resistance': 'IPX4',
    },
  ),
  Product(
    id: 'prod_deskmat_009',
    name: 'LuxMat Pro Desk Mat',
    description: ''' ## Product Features

- Smooth vegan leather surface
- Anti-slip rubber base
- Comes with cable organizer

[Learn how it’s made](https://example.com)

![Product Detail](https://images.pexels.com/photos/5082562/pexels-photo-5082562.jpeg)
''',
    price: 39.99,
    rating: 4.8,
    images: [
      'https://images.pexels.com/photos/5082562/pexels-photo-5082562.jpeg',
    ],
    availableColors: [Colors.grey, Colors.teal],
    brand: 'DeskZen',
    features: [
      'Waterproof Surface',
      'Wide Format',
      'Magnetic Cable Holder',
    ],
    category: 'Accessories',
    reviewCount: 78,
    isFavorite: true,
    createdAt: DateTime(2025, 3, 18),
    tags: ['desk', 'accessory', 'workspace'],
    specifications: {
      'Material': 'Vegan Leather',
      'Dimensions': '35x16 inches',
      'Weight': '650g',
    },
  ),
  Product(
    id: 'prod_pouch_010',
    name: 'UrbanGear Cable Pouch',
    description: ''' ## Product Features

- Multi-compartment storage
- Premium zippers and stitching
- Weather-resistant material

[See internal layout](https://example.com)

![Product Detail](https://images.pexels.com/photos/267394/pexels-photo-267394.jpeg)
''',
    price: 24.99,
    rating: 4.5,
    images: [
      'https://images.pexels.com/photos/267394/pexels-photo-267394.jpeg',
    ],
    availableColors: [Colors.indigo, Colors.brown],
    brand: 'UrbanGear',
    features: [
      'Elastic Cable Loops',
      'Zipper Mesh Pocket',
      'Slim Profile',
    ],
    category: 'Organizers',
    reviewCount: 45,
    isFavorite: false,
    createdAt: DateTime(2025, 4, 3),
    tags: ['organizer', 'travel', 'tech'],
    specifications: {
      'Material': 'Nylon',
      'Weight': '200g',
      'Compatibility': 'All cables & small gadgets',
    },
  ),
];
