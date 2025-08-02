import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

Widget buildNotificationIcon() {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.notificationColor,
    ),
    child: const Icon(
      Icons.notifications_none_outlined,
      color: AppColors.primaryColor,
    ),
  );
}
