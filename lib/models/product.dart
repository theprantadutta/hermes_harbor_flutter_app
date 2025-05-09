import 'dart:ui';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final List<String> images;
  final List<Color> availableColors;
  final String brand;
  final List<String> features;
  final String category;
  final int reviewCount;
  final bool isFavorite;
  final DateTime createdAt;
  final List<String>? tags;
  final Map<String, String>? specifications;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.images,
    required this.availableColors,
    this.brand = 'HERMES HARBOR',
    this.features = const [],
    required this.category,
    this.reviewCount = 0,
    this.isFavorite = false,
    required this.createdAt,
    this.tags,
    this.specifications,
  });

  // Helper method to get first image (for thumbnails)
  String get thumbnail => images.first;

  // Formatted price (e.g. \$129.99)
  String get formattedPrice => '\$$price';

  // Star rating display (e.g. ⭐ 4.8)
  String get starRating => '⭐ $rating';

  // Convert to Map (for Firestore/API)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'rating': rating,
      'images': images,
      'availableColors': availableColors.map((c) => c.value).toList(),
      'brand': brand,
      'features': features,
      'category': category,
      'reviewCount': reviewCount,
      'isFavorite': isFavorite,
      'createdAt': createdAt.toIso8601String(),
      'tags': tags,
      'specifications': specifications,
    };
  }

  // Create from Map (from Firestore/API)
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
      rating: (map['rating'] as num?)?.toDouble() ?? 0.0,
      images: List<String>.from(map['images'] ?? []),
      availableColors: (map['availableColors'] as List<dynamic>?)
              ?.map((c) => Color(c as int))
              .toList() ??
          [],
      brand: map['brand'] ?? 'HERMES HARBOR',
      features: List<String>.from(map['features'] ?? []),
      category: map['category'] ?? '',
      reviewCount: map['reviewCount'] ?? 0,
      isFavorite: map['isFavorite'] ?? false,
      createdAt:
          DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
      tags: map['tags'] != null ? List<String>.from(map['tags']) : null,
      specifications: map['specifications'] != null
          ? Map<String, String>.from(map['specifications'])
          : null,
    );
  }

  // Copy with method (for immutability)
  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    double? rating,
    List<String>? images,
    List<Color>? availableColors,
    String? brand,
    List<String>? features,
    String? category,
    int? reviewCount,
    bool? isFavorite,
    DateTime? createdAt,
    List<String>? tags,
    Map<String, String>? specifications,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      images: images ?? this.images,
      availableColors: availableColors ?? this.availableColors,
      brand: brand ?? this.brand,
      features: features ?? this.features,
      category: category ?? this.category,
      reviewCount: reviewCount ?? this.reviewCount,
      isFavorite: isFavorite ?? this.isFavorite,
      createdAt: createdAt ?? this.createdAt,
      tags: tags ?? this.tags,
      specifications: specifications ?? this.specifications,
    );
  }
}
