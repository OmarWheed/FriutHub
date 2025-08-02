
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/product_cubit/product_cubit.dart';
import 'package:fruits_hub/core/cubits/product_cubit/product_state.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/products_grid_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/dummy_data.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductGridViewBlocBuilder extends StatelessWidget {
  const ProductGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      switch (state) {
        case ProductInital():
        case ProductLoading():
          return _buildStateLoading();
        case ProductLoaded():
          return BestSellingGridView(
            products: state.products,
          );

        case ProductFailure():
          return _buildStateFailure(msg: state.message);
      }
    });
  }

  Widget _buildStateFailure({required String msg}) {
    return Center(
      child: Text(msg),
    );
  }

  Widget _buildStateLoading() {
    return Skeletonizer.sliver(
        enabled: true,
        child: BestSellingGridView(
          products: getDummyProducts,
        ));
  }
}
