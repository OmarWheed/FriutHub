import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/product_deep_details.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  static const String routeName = "DETAILS_VIEW";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: AppColors.backgroundColorContainerOfDetails,
                image: DecorationImage(
                  scale: 1,
                  image: AssetImage(Assets.watermelon),
                )),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Column(
              children: [
                ListTile(
                  trailing: const SizedBox(
                    width: 100,
                    child: SizedBox(),
                    //Counter(),
                  ),
                  title: const Text(
                    "بطيخ",
                    style: TextStyles.bold16,
                  ),
                  subtitle: Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "20جنيه ",
                        style: TextStyles.semiBold13
                            .copyWith(color: AppColors.secondaryColor)),
                    TextSpan(
                        text: " / الكيلو",
                        style: TextStyles.semiBold13
                            .copyWith(color: AppColors.lightSecondaryColor))
                  ])),
                ),
                Row(
                  spacing: 10,
                  children: [
                    const Icon(
                      Icons.star_outlined,
                      color: AppColors.starColor,
                    ),
                    const Text(
                      "4.5",
                      style: TextStyles.semiBold13,
                    ),
                    Text(
                      "(30+)",
                      style: TextStyles.regular13
                          .copyWith(color: AppColors.subColor),
                    ),
                    Text(
                      "المراجعه",
                      style: TextStyles.bold13.copyWith(
                          color: AppColors.buttonColor,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                  child: Text(
                    '''ينتمي إلى الفصيلة القرعية ولثمرته لُب حلو المذاق وقابل للأكل، وبحسب علم النبات فهي تعتبر ثمار لبيّة، تستعمل لفظة البطيخ للإشارة إلى النبات نفسه أو إلى الثمرة تحديداً''',
                    maxLines: 3,
                    style: TextStyles.regular13
                        .copyWith(color: AppColors.subColor),
                  ),
                ),
                const Row(
                  spacing: 16,
                  children: [
                    Expanded(
                        child: ProductDeepDetails(
                      name: "عام",
                      details: "الصلاحيه",
                      imgName: Assets.calander,
                    )),
                    Expanded(
                        child: ProductDeepDetails(
                      name: "100 %",
                      details: "اوجانيك",
                      imgName: Assets.organic,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Row(
                  spacing: 16,
                  children: [
                    Expanded(
                        child: ProductDeepDetails(
                      name: "80 كالوري",
                      details: "100 جرام",
                      imgName: Assets.calories,
                    )),
                    Expanded(
                        child: ProductDeepDetails(
                      name: "4.8 (256)",
                      details: "الاراء",
                      imgName: Assets.star,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Text("أضف الي السلة"))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
