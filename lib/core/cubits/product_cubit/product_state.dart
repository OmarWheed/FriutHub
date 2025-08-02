import 'package:fruits_hub/core/entitys/product_entity.dart';

sealed class ProductState {}

final class ProductInital extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  final List<ProductEntity> products;
  ProductLoaded(this.products);
}

final class ProductFailure extends ProductState {
  final String message;
  ProductFailure(this.message);
}
