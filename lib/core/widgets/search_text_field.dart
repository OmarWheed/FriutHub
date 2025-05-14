import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 9,
          offset: Offset(0, 2),
          spreadRadius: 0,
          color: Color(0x0A000000),
        ),  
      ]),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          enabled: true,
          enabledBorder: buildBorder(),
          border: buildBorder(),
          focusedBorder: buildBorder(),
          fillColor: AppColors.backgroundColor,
          filled: true,
          prefixIcon: SizedBox(
              width: 30,
              child: Center(
                child: SvgPicture.asset(
                  Assets.search,
                  height: 30,
                ),
              )),
          hintText: "ابحث عن.......",
          suffixIcon: SizedBox(
              width: 20, child: Center(child: SvgPicture.asset(Assets.filter))),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() => OutlineInputBorder(
        borderSide:
            const BorderSide(color: AppColors.outLineBorderColor, width: 1),
        borderRadius: BorderRadius.circular(4),
      );
}
