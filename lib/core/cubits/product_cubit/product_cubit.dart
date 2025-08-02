import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/product_cubit/product_state.dart';
import 'package:fruits_hub/core/repos/product_repo.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo productRepo;
  ProductCubit({required this.productRepo}) : super(ProductInital());
  int productLen = 0;
  Future<void> getProduct() async {
    emit(ProductLoading());
    final products = await productRepo.getProduct();

    products.fold((failure) {
      emit(ProductFailure(failure.message));
    }, (products) {
      productLen = products.length;
      emit(ProductLoaded(products));
    });
  }

  Future<void> getBestSellingProduct() async {
    emit(ProductLoading());
    final products = await productRepo.getBestSellingProduct();

    products.fold((failure) {
      emit(ProductFailure(failure.message));
    }, (products) {
      print(products.map((product) {
        return product.productName;
      }));
      emit(ProductLoaded(products));
    });
  }
}
