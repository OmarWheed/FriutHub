import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/home/cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/product_list_tile.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<CartCubit>();
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  buildAppBar(context, title: 'السلة'),
                  const SizedBox(height: 16),
                  _buildHeader(cubit),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            const CartItemsList()
          ],
        ),
        cubit.cartEntity.cartItems.isEmpty
            ? const SizedBox()
            : Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: ElevatedButton(
                      onPressed: () {},
                      child:
                          Text(" الدفع  \t${cubit.cartEntity.calTotalPrice} \t جنيه ")),
                ),
              )
      ],
    );
  }

  Widget _buildHeader(CartCubit cubit) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      color: AppColors.offGreen,
      child: Center(
        child: Text(
          "لديك ${cubit.cartItemsLength} منتجات في سله التسوق",
          style: TextStyles.regular13.copyWith(color: AppColors.buttonColor),
        ),
      ),
    );
  }
}

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<CartCubit>();
    return SliverList.separated(
      itemCount: cubit.cartItemsLength,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ProductListTile(
          cardItemEntity: cubit.cartEntity.cartItems[index],
        ),
      ),
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        thickness: 0.2,
      ),
    );
  }
}
