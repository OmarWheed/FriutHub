import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entitys/product_entity.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/home/cubit/cart_cubit.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xffF3F5F7)),
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                // Flexible(
                //     child: Image.network(
                //   productEntity.imageUrl??"https://via.placeholder.com/150",
                //   height: 200,
                // )),
                Placeholder(
                  fallbackHeight: 100,
                
                ),
                const SizedBox(
                  height: 24,
                ),
                ListTile(
                    trailing: CircleAvatar(
                        backgroundColor: AppColors.buttonColor,
                        child: IconButton(
                          onPressed: () {
                            context.read<CartCubit>().addProduct(productEntity);
                          },
                          icon: const Icon(
                            Icons.add,
                            color: AppColors.backgroundColor,
                          ),
                        )),
                    title: Text(
                      productEntity.productName,
                      style: TextStyles.semiBold13,
                    ),
                    subtitle: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: productEntity.productPrice.toString(),
                          style: TextStyles.bold13
                              .copyWith(color: AppColors.secondaryColor)),
                      TextSpan(
                          text: productEntity.unitAmount.toString(),
                          style: TextStyles.bold13
                              .copyWith(color: AppColors.lightSecondaryColor)),
                    ])))
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline_sharp),
            ),
          ),
        ],
      ),
    );
  }
}
