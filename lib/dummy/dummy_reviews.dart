import '../models/product_review.dart';

final List<ProductReview> dummyReviews = [
  ProductReview(
    userId: 'user_001',
    productId: 'prod_001',
    userName: 'Alex Morgan',
    userImage: 'https://i.pravatar.cc/150?img=5',
    date: '1 week ago',
    rating: 5.0,
    comment: 'Absolutely stunning! The craftsmanship is exceptional.',
  ),
  ProductReview(
    userId: 'user_002',
    productId: 'prod_001',
    userName: 'Jordan Smith',
    userImage: 'https://i.pravatar.cc/150?img=12',
    date: '3 weeks ago',
    rating: 4.0,
    comment: 'Beautiful product but took longer to ship than expected.',
  ),
];
