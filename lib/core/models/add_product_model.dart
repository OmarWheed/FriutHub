import 'package:fruits_hub/core/entitys/product_entity.dart';
import 'package:fruits_hub/core/models/review_model.dart';

class ProductModel {
  final String productName;
  final double productPrice;
  final String productCode;
  final String productDescribtion;
  final bool isFeature;
  String? imageUrl;
  final int expirationsMonths;
  final int numberOfCalories;
  final bool isOrganic;
  final double avgRating;
  final double ratingCount;
  final int unitAmount;
  final int sellingCount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.productName,
    required this.productPrice,
    required this.productCode,
    required this.productDescribtion,
    required this.isFeature,
    this.isOrganic = false,
    this.imageUrl,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.avgRating = 0,
    this.ratingCount = 0,
    required this.sellingCount,
    required this.reviews,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        productName: json['productName'],
        productPrice: json['productPrice'].toDouble(),
        imageUrl: json['imageUrl'],
        productCode: json["productCode"],
        productDescribtion: json["productDescribtion"],
        isFeature: json["isFeature"],
        expirationsMonths: json["expirationsMonths"],
        numberOfCalories: json["numberOfCalories"],
        unitAmount: json["unitAmount"] ?? 0,
        sellingCount: json["sellingCount"] ?? 0,
        reviews: json["reviews"] != null
            ? List<ReviewModel>.from(
                json['reviews'].map((e) => ReviewModel.fromJson(e)))
            : []);
  }

  Map<String, dynamic> toJson() {
    return {
      "productName": productName,
      "productPrice": productPrice,
      "productCode": productCode,
      "productDescribtion": productDescribtion,
      "isFeature": isFeature,
      "imageUrl": imageUrl,
      "expirationsMonths": expirationsMonths,
      "numberOfCalories": numberOfCalories,
      "unitAmount": unitAmount,
      "reviews": reviews.map((e) => e.toJson()).toList(),
    };
  }

  ProductEntity toEntity() {
    return ProductEntity(
        imageUrl: imageUrl!,
        productName: productName,
        productPrice: productPrice,
        productCode: productCode,
        productDescribtion: productDescribtion,
        isFeature: isFeature,
        reviews: reviews.map((review) => review.toEntity()).toList(),
        expirationsMonths: expirationsMonths,
        numberOfCalories: numberOfCalories,
        unitAmount: unitAmount);
  }
}
