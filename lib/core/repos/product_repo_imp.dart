import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entitys/product_entity.dart';
import 'package:fruits_hub/core/error/failure.dart';
import 'package:fruits_hub/core/helper/build_debug_print_color.dart';
import 'package:fruits_hub/core/models/add_product_model.dart';
import 'package:fruits_hub/core/repos/product_repo.dart';
import 'package:fruits_hub/core/services/db_service.dart';

class ProductRepoImp extends ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImp({required this.databaseService});

  @override
  Future<Either<Failure, List<ProductEntity>>> getProduct() async {
    try {
      var data = await databaseService.getData(path: "product")
          as List<Map<String, dynamic>>;
      List<ProductModel> products = data.map((prodcut) {
        return ProductModel.fromJson(prodcut);
      }).toList();
      List<ProductEntity> productsEntity =
          products.map((productModel) => productModel.toEntity()).toList();

      return Right(productsEntity);
    } catch (e) {
   
      return Left(ServerFailure("Error Occured when get Product"));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProduct() async {
    try {
      var data = await databaseService.getData(path: "product", qurey: {
        'limit': 10,
        'orderBy': 'sellingCount',
        'descending': true,
      }) as List<Map<String, dynamic>>;
      List<ProductModel> products = data.map((prodcut) {
        return ProductModel.fromJson(prodcut);
      }).toList();
      List<ProductEntity> productsEntity =
          products.map((productModel) => productModel.toEntity()).toList();

      return Right(productsEntity);
    } catch (e) {
         PrintMessage(e.toString()).r;
      return Left(ServerFailure("Error Occured when getBestSellingProduct"));
    }
  }
}
