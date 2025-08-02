import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

ThemeData getLightTheme() {
  return ThemeData(
    fontFamily: 'Cairo',
    scaffoldBackgroundColor: AppColors.backgroundColor,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: AppColors.primaryColor,
    ),
    ///////AppBar
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyles.bold19,
      backgroundColor: Colors.transparent,
    ),
    //////// ElevatedButton
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonColor,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 55),
        textStyle: TextStyles.bold16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    /////// TextField
    ///TODO: MAKE FUNCTION RETURN border (InputDecorationTheme)
    inputDecorationTheme: InputDecorationTheme(
      fillColor: const Color(0xffF9FAFA),
      hintStyle:
          TextStyles.bold13.copyWith(color: AppColors.textColorInFormFiled),
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: AppColors.textFormFiledColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.textFormFiledColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.bordererrorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.bordererrorColor),
      ),
      errorStyle: TextStyles.bold13.copyWith(
        color: AppColors.bordererrorColor,
      ),
    ),

    /////// Checkbox
    checkboxTheme: CheckboxThemeData(
      side: const BorderSide(
        color: AppColors.textColorInFormFiled,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
    ),
  );
}
