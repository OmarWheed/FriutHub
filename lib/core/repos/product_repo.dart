import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entitys/product_entity.dart';
import 'package:fruits_hub/core/error/failure.dart';

abstract class ProductRepo {
  Future<Either<Failure,List<ProductEntity>>>getProduct();
  Future<Either<Failure,List<ProductEntity>>>getBestSellingProduct();
}