import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController? controller;
  const PasswordField({super.key, this.controller});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obsureText = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      autoFillHints: AutofillHints.password,
      textInputAction: TextInputAction.done,
      hintText: "كلمة المرور",
      obscureText: obsureText,
      icon: IconButton(
        icon: obsureText
            ? const Icon(
                Icons.visibility_off,
                color: AppColors.textColorInFormFiled,
              )
            : const Icon(
                Icons.visibility,
                color: AppColors.textColorInFormFiled,
              ),
        onPressed: () {
          setState(() {
            obsureText = !obsureText;
          });
        },
      ),
    );
  }
}
