import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/build_notification.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(Assets.profile),
      title: Text("صباح الخير !..",
          style: TextStyles.regular16
              .copyWith(color: AppColors.textColorInFormFiled)),
      subtitle: const Text("أحمد مصطفي", style: TextStyles.bold16),
      trailing: buildNotificationIcon(),
    );
  }
}
