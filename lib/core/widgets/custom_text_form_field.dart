import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.obscureText,
    this.textInputType,
    this.icon,
    this.onSaved,
    this.textInputAction,
    this.autoFillHints,
  });
  final TextEditingController? controller;
  final String hintText;
  final bool? obscureText;
  final Widget? icon;
  final TextInputType? textInputType;
  final void Function(String?)? onSaved;
  final TextInputAction? textInputAction;
  final String? autoFillHints;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) {
        TextInput.finishAutofillContext();
      },
      autofillHints: [autoFillHints ?? AutofillHints.name],
      onSaved: onSaved,
      validator: (val) {
        if (val == null || val.isEmpty) return 'هذا الحقل مطلوب ';
        return null;
      },
      inputFormatters: [
        FilteringTextInputFormatter.deny(
          RegExp(
            r'[\u{1F600}-\u{1F64F}|' // Emoticons
            r'\u{1F300}-\u{1F5FF}|' // Misc Symbols & Pictographs
            r'\u{1F680}-\u{1F6FF}|' // Transport & Map
            r'\u{2600}-\u{26FF}|' // Misc symbols
            r'\u{2700}-\u{27BF}|' // Dingbats
            r'\u{1F900}-\u{1F9FF}]', // Supplemental Symbols & Pictographs
            unicode: true,
          ),
        )
      ],
      textInputAction: textInputAction ?? TextInputAction.next,
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
