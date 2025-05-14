import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    
      decoration: const BoxDecoration(color: Color(0xffF3F5F7)),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline_sharp),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(Assets.watermelon),
                const SizedBox(
                  height: 24,
                ),
                ListTile(
                    trailing: CircleAvatar(
                        backgroundColor: AppColors.buttonColor,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            color: AppColors.backgroundColor,
                          ),
                        )),
                    title: const Text(
                      "بطيخ",
                      style: TextStyles.semiBold13,
                    ),
                    subtitle: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "20جنية/ ",
                          style: TextStyles.bold13
                              .copyWith(color: AppColors.secondaryColor)),
                      TextSpan(
                          text: "الكيلو",
                          style: TextStyles.bold13
                              .copyWith(color: AppColors.lightSecondaryColor)),
                    ])))
              ],
            ),
          )
        ],
      ),
    );
  }
}
