import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.obscureText,
      this.textInputType,
      this.icon});
  final TextEditingController controller;
  final String hintText;
  final bool? obscureText;
  final Widget? icon;
  final TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      style: TextStyles.semiBold16,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: icon,
      ),
      keyboardType: textInputType ?? TextInputType.emailAddress,
    );
  }
}
