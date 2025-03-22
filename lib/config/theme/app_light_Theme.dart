import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_Styles.dart';

ThemeData getLightTheme() {
  return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Cairo',
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              minimumSize: Size(double.infinity, 55),
              textStyle: TextStyles.bold16,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ))));
}
