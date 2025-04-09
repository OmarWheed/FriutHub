import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon(
      {super.key, required this.logo, required this.title, this.onTap});
  final String logo;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 15),
            SvgPicture.asset(
              logo,
            ),
            Expanded(child: Container()),
            Text(
              title,
              style: TextStyles.semiBold16,
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
