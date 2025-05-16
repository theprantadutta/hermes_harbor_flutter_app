import 'package:flutter/material.dart';

import '../components/home/home_screen_categories.dart';
import '../models/product.dart';

final relatedProducts = [
  Product(
    id: 'prod_smartband_002',
    name: 'FitLite Smartband 3',
    description: ''' ## Product Features

- Handcrafted from premium materials
- Available in 3 luxurious finishes
- 2-year warranty included

[Learn more about our materials](https://example.com)

![Product Detail](https://images.pexels.com/photos/267394/pexels-photo-267394.jpeg)
''',
    price: 129.99,
    rating: 4.2,
    images: [
      'https://images.pexels.com/photos/267394/pexels-photo-267394.jpeg',
    ],
    availableColors: [Colors.blueGrey, Colors.deepPurple],
    brand: 'FitPulse',
    features: ['Step Tracking', 'Sleep Monitor', 'Notification Alerts'],
    category: categories[3].name,
    reviewCount: 89,
    isFavorite: false,
    createdAt: DateTime(2025, 3, 12),
    tags: ['fitness', 'wearable'],
    specifications: {
      'Battery': '7 Days',
      'Display': '1.1” OLED',
      'Waterproof': 'Yes',
    },
  ),
  Product(
    id: 'prod_wirelessbuds_003',
    name: 'EchoBuds Pro 2',
    description: ''' ## Product Features

- Handcrafted from premium materials
- Available in 3 luxurious finishes
- 2-year warranty included

[Learn more about our materials](https://example.com)

![Product Detail](https://images.pexels.com/photos/267394/pexels-photo-267394.jpeg)
''',
    price: 149.99,
    rating: 4.4,
    images: [
      'https://images.pexels.com/photos/3394654/pexels-photo-3394654.jpeg',
    ],
    availableColors: [Colors.white, Colors.black],
    brand: 'EchoSound',
    features: [
      'Active Noise Cancellation',
      'Wireless Charging Case',
      'Bluetooth 5.3'
    ],
    category: categories[3].name,
    reviewCount: 144,
    isFavorite: false,
    createdAt: DateTime(2025, 2, 28),
    tags: ['audio', 'wireless', 'tech'],
    specifications: {
      'Battery': '5h + 20h (Case)',
      'Driver Size': '10mm',
      'Water Resistance': 'IPX5',
    },
  ),
  Product(
    id: 'prod_watchstrap_004',
    name: 'AurumX Premium Strap Set',
    description: ''' ## Product Features

- Handcrafted from premium materials
- Available in 3 luxurious finishes
- 2-year warranty included

[Learn more about our materials](https://example.com)

![Product Detail](https://images.pexels.com/photos/267394/pexels-photo-267394.jpeg)
''',
    price: 89.99,
    rating: 4.9,
    images: [
      'https://images.pexels.com/photos/6155297/pexels-photo-6155297.jpeg',
    ],
    availableColors: [Colors.brown, Colors.black],
    brand: 'HERMES HARBOR',
    features: ['Quick Release Design', 'Stitched Finish', 'Genuine Leather'],
    category: categories[3].name,
    reviewCount: 52,
    isFavorite: false,
    createdAt: DateTime(2025, 4, 5),
    tags: ['leather', 'accessory', 'strap'],
    specifications: {
      'Material': 'Italian Leather',
      'Sizes': '20mm, 22mm',
      'Compatible Models': 'AurumX Chrono, FitLite',
    },
  ),
  Product(
    id: 'prod_charger_005',
    name: 'MagCharge Duo Pad',
    description: ''' ## Product Features

- Handcrafted from premium materials
- Available in 3 luxurious finishes
- 2-year warranty included

[Learn more about our materials](https://example.com)

![Product Detail](https://images.pexels.com/photos/267394/pexels-photo-267394.jpeg)
''',
    price: 59.99,
    rating: 4.3,
    images: [
      'https://images.pexels.com/photos/4042800/pexels-photo-4042800.jpeg',
    ],
    availableColors: [Colors.white, Colors.black],
    brand: 'PowerGrid',
    features: ['15W Fast Charge', 'Dual Coil Technology', 'USB-C Input'],
    category: categories[3].name,
    reviewCount: 76,
    isFavorite: true,
    createdAt: DateTime(2025, 1, 22),
    tags: ['charging', 'wireless', 'accessory'],
    specifications: {
      'Output': '15W + 5W',
      'Port': 'USB-C',
      'Includes': 'Charging cable & case',
    },
  ),
  Product(
    id: 'prod_case_006',
    name: 'Chrono Watch Guard Case',
    description: ''' ## Product Features

- Handcrafted from premium materials
- Available in 3 luxurious finishes
- 2-year warranty included

[Learn more about our materials](https://example.com)

![Product Detail](https://images.pexels.com/photos/267394/pexels-photo-267394.jpeg)
''',
    price: 19.99,
    rating: 4.1,
    images: [
      'https://images.pexels.com/photos/267394/pexels-photo-267394.jpeg',
    ],
    availableColors: [Colors.transparent, Colors.black12],
    brand: 'HERMES HARBOR',
    features: ['Shock Absorbing Corners', 'Snug Fit', 'Lightweight'],
    category: categories[4].name,
    reviewCount: 33,
    isFavorite: false,
    createdAt: DateTime(2025, 3, 2),
    tags: ['case', 'watch-protection'],
    specifications: {
      'Material': 'Polycarbonate',
      'Weight': '5g',
      'Compatibility': 'AurumX Chrono',
    },
  ),
  Product(
    id: 'prod_bundle_007',
    name: 'Smart Lifestyle Essentials Bundle',
    description: ''' ## Product Features

- Handcrafted from premium materials
- Available in 3 luxurious finishes
- 2-year warranty included

[Learn more about our materials](https://example.com)

![Product Detail](https://images.pexels.com/photos/267394/pexels-photo-267394.jpeg)
''',
    price: 899.99,
    rating: 4.7,
    images: [
      'https://images.pexels.com/photos/4388088/pexels-photo-4388088.jpeg',
    ],
    availableColors: [Colors.black, Colors.cyan],
    brand: 'HERMES HARBOR',
    features: ['4-in-1 Bundle', 'Gift-Ready Packaging', '1-Year Warranty'],
    category: categories[1].name,
    reviewCount: 67,
    isFavorite: true,
    createdAt: DateTime(2025, 3, 25),
    tags: ['bundle', 'gift', 'tech-set'],
    specifications: {
      'Includes': 'Smartwatch, Strap, Buds, Charger',
      'Warranty': '1 Year',
    },
  ),
];
