import 'package:fruits_hub/core/entitys/review_entity.dart';

class ReviewModel {
  final String name;
  final String imageProfile;
  final String review;
  final String date;
  final num rating;

  ReviewModel({
    required this.name,
    required this.imageProfile,
    required this.review,
    required this.date,
    required this.rating,
  });

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      name: entity.name,
      imageProfile: entity.imageProfile,
      review: entity.review,
      date: entity.date,
      rating: entity.rating,
    );
  }
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json["name"],
      imageProfile: json["image"],
      review: json["review"],
      date: json["date"],
      rating: json["rating"],
    );
  }
  toJson() {
    return {
      "name": name,
      "image": imageProfile,
      "date": date,
      "rating": rating,
      "review": review,
    };
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      imageProfile: imageProfile,
      review: review,
      date: date,
      rating: rating,
    );
  }
}
