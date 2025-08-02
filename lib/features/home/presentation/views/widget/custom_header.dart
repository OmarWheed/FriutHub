import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/cubits/product_cubit/product_cubit.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final productLen = context.read<ProductCubit>().productLen;
    return Row(
      children: [
        Text(
          "$productLen نتائج",
          style: TextStyles.bold16,
        ),
        const Spacer(),
        SvgPicture.asset(Assets.filter2),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
