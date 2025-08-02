import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/product_cubit/product_cubit.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/build_notification.dart';
import 'package:fruits_hub/core/widgets/search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/product_grid_view_bloc_builder.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/custom_header.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});
  static const String routeName = "product_view";
  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  void didChangeDependencies() {
    context.read<ProductCubit>().getProduct();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  spacing: 16,
                  children: [
                    const SizedBox(height: 16),
                    _buildAppBar(title: 'المنتجات'),
                    const SearchTextField(),
                    const CustomHeader(),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              //blocBuilder
              const ProductGridViewBlocBuilder()
            ],
          )),
    );
  }

  AppBar _buildAppBar({required String title}) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyles.bold19,
      ),
      actions: [buildNotificationIcon()],
    );
  }
}
