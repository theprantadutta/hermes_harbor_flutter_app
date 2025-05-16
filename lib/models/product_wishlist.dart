import 'package:hermes_harbor_flutter_app/models/product.dart';

class ProductWishlist {
  final Product product;
  final bool isFavorite;

  ProductWishlist({required this.product, required this.isFavorite});
}
