class ProductReview {
  final String? userId;
  final String productId;
  final String? userName;
  final String? userImage;
  final String date;
  final double rating;
  final String comment;

  ProductReview({
    this.userId,
    required this.productId,
    this.userName,
    this.userImage,
    required this.date,
    required this.rating,
    required this.comment,
  });
}
