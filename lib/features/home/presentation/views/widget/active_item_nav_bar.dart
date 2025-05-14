
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class ActiveItem extends StatelessWidget {
  final String icon;
  final String name;

  const ActiveItem({super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        decoration: const ShapeDecoration(
            color: Color(0xFFEEEEEE),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: const ShapeDecoration(
                  color: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)))),
              child: Center(
                child: SvgPicture.asset(icon),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              name,
              style:
                  TextStyles.semiBold11.copyWith(color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}

