// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entitys/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity product;
  int count;

  @override
  List<Object> get props => [product];
  CartItemEntity({
    required this.product,
    this.count = 1,
  });
  void increaseCount() {
    count++;
  }

  void decreaseCount() {
    if (count > 0) count--;
  }

  double get caluTotalPrice => count * product.productPrice;
  int get caluTotalWegiht => count * product.unitAmount;
}
