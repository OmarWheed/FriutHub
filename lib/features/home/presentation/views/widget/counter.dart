import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/home/cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/domin/entity/cart_item_entity.dart';

class Counter extends StatelessWidget {
  const Counter(this.cartItemEntity, {super.key});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            _buildBottonCounter(
                onTap: () {
                  cartItemEntity.increaseCount();
                  context.read<CartCubit>().updateCart();
                },
                backgroundColor: AppColors.primaryColor,
                icon: Icons.add,
                color: AppColors.white),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                cartItemEntity.count.toString(),
                style: TextStyles.bold16,
              ),
            ),
            _buildBottonCounter(
              backgroundColor: AppColors.outLineBorderColor,
              icon: Icons.remove,
              onTap: () {
                cartItemEntity.decreaseCount();
                 context.read<CartCubit>().updateCart();
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottonCounter({
    required Color backgroundColor,
    required IconData icon,
    Color? color,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration:
            BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
        padding: const EdgeInsets.all(3),
        alignment: Alignment.center,
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
