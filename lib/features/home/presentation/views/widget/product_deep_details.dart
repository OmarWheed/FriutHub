import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class ProductDeepDetails extends StatelessWidget {
  const ProductDeepDetails({
    required this.name,
    required this.details,
    required this.imgName,
    super.key,
  });

  final String name;
  final String details;
  final String imgName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.productDetailsColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        spacing: 10,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:
                    TextStyles.bold16.copyWith(color: AppColors.productTitleColor),
              ),
              Text(
                details,
                style:
                    TextStyles.semiBold13.copyWith(color: AppColors.subColor),
              )
            ],
          ),
          SvgPicture.asset(imgName),
        ],
      ),
    );
  }
}
