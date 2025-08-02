import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/product_cubit/product_cubit.dart';
import 'package:fruits_hub/core/widgets/search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/best_seller_header.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/product_grid_view_bloc_builder.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/custom_home_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/offer_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void didChangeDependencies() {
    if (mounted) {
      context.read<ProductCubit>().getBestSellingProduct();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              spacing: 16,
              children: [
                SizedBox(height: 16),
                CustomHomeAppBar(),
                SearchTextField(),
                OfferList(),
                BestSellerHeader(),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          ProductGridViewBlocBuilder()
        ],
      ),
    );
  }
}
