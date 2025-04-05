import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class AgreeOfTermAndCondistion extends StatefulWidget {
  const AgreeOfTermAndCondistion({super.key, required this.onChange});
  final ValueChanged<bool> onChange;

  @override
  State<AgreeOfTermAndCondistion> createState() =>
      _AgreeOfTermAndCondistionState();
}

class _AgreeOfTermAndCondistionState extends State<AgreeOfTermAndCondistion> {
  bool isTermAgree = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.translate(
          offset: const Offset(15, -11),
          child: Checkbox(
            value: isTermAgree,
            onChanged: (val) {
              setState(() {
                isTermAgree = val!;
                widget.onChange(val);
              });
            },
          ),
        ),
        Expanded(
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "من خلال إنشاء حساب ، فإنك توافق على ",
                style: TextStyles.semiBold16
                    .copyWith(color: AppColors.textColorInFormFiled)),
            TextSpan(
                text: "الشروط والأحكام الخاصة بنا ",
                style: TextStyles.semiBold16
                    .copyWith(color: AppColors.lightPrimaryColor)),
          ])),
        ),
      ],
    );
  }
}
