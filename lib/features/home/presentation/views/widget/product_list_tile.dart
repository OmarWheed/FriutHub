import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/home/cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/cubit/cart_state.dart';
import 'package:fruits_hub/features/home/domin/entity/cart_item_entity.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/details_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/counter.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({super.key, required this.cardItemEntity});

  final CartItemEntity cardItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (pre, nex) {
        return nex.isUpdate;
      },
      builder: (context, state) {
        return SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Row(
              children: [
                GestureDetector(
                    child: Image.asset(
                      Assets.watermelon,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(DetailsScreen.routeName);
                    }),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNameRow(
                          cardItemEntity.product.productName, context),
                      _buildWeightRow(cardItemEntity.caluTotalWegiht),
                      _buildCounterRow(cardItemEntity.caluTotalPrice)
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }

  Widget _buildNameRow(String name, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyles.regular13,
        ),
        GestureDetector(
            onTap: () {
              context.read<CartCubit>().removeFromCart(cardItemEntity);
            },
            child: SvgPicture.asset(Assets.trash)),
      ],
    );
  }

  Widget _buildWeightRow(int weight) {
    return Row(
      children: [
        Text(
          "$weight كم",
          style: TextStyles.regular13.copyWith(color: AppColors.secondaryColor),
        ),
      ],
    );
  }

  Widget _buildCounterRow(double totalPrice) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Counter(cardItemEntity),
        Text(
          "$totalPrice جنيه",
          style: TextStyles.bold13.copyWith(color: AppColors.secondaryColor),
        ),
      ],
    );
  }
}
