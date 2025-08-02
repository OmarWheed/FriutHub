import 'package:fruits_hub/core/entitys/review_entity.dart';

class ProductEntity {
  final String productName;
  final double productPrice;
  final String productCode;
  final String productDescribtion;
  final bool isFeature;
  final String imageUrl;
  final int expirationsMonths;
  final int numberOfCalories;
  final bool isOrganic;
  final double avgRating;
  final double ratingCount;
  final int unitAmount;
  final List<ReviewEntity> reviews;
  ProductEntity({
    required this.productName,
    required this.productPrice,
    required this.productCode,
    required this.productDescribtion,
    required this.isFeature,
    this.isOrganic = false,
    required this.imageUrl,
    required this.reviews,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.avgRating = 0,
    this.ratingCount = 0,
  });
}
