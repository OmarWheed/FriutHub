
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class BestSellerHeader extends StatelessWidget {
  const BestSellerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "الأكثر مبيعًا",
          style: TextStyles.bold16,
        ),
        Text(
          "المزيد",
          style: TextStyles.regular13
              .copyWith(color: AppColors.textColorInFormFiled),
        ),
      ],
    );
  }
}
