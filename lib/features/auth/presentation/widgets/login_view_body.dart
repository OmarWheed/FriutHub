import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/config/routes/app_route_name.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_Styles.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late TextEditingController emailController;

  late TextEditingController passwordController;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          spacing: 16,
          children: [
            CustomTextFormField(
              controller: emailController,
              hintText: "البريد الإلكتروني",
              textInputType: TextInputType.emailAddress,
            ),
            CustomTextFormField(
              obscureText: true,
              controller: passwordController,
              textInputType: TextInputType.visiblePassword,
              hintText: "كلمة المرور",
              icon: Icon(
                Icons.visibility,
                color: AppColors.textColorInFormFiled,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "نسيت كلمة المرور؟",
                style: TextStyles.semiBold13.copyWith(
                  color: AppColors.lightPrimaryColor,
                ),
              ),
            ),
            SizedBox(height: 14),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  "تسجيل دخول",
                )),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "لا تمتلك حساب",
                  style: TextStyles.semiBold16
                      .copyWith(color: AppColors.textColorInFormFiled)),
              TextSpan(
                  text: " ؟",
                  style: TextStyles.semiBold16
                      .copyWith(color: AppColors.textColorInFormFiled)),
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRouteName.signUp);
                    },
                  text: " قم بأنشاء حساب",
                  style: TextStyles.semiBold16
                      .copyWith(color: AppColors.buttonColor)),
            ])),
            SizedBox(height: 14),
            _buildDividerLine(),
            _buildButtonWithIcon(
                title: "تسجيل بواسطة جوجل", logo: Assets.googleLogo),
            _buildButtonWithIcon(
                title: "تسجيل بواسطة أبل", logo: Assets.appleLogo),
            _buildButtonWithIcon(
                title: "تسجيل بواسطة فيسبوك", logo: Assets.facebookLogo)
          ],
        ),
      ),
    );
  }

  Widget _buildButtonWithIcon({required String title, required String logo}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 15),
          SvgPicture.asset(
            logo,
          ),
          Expanded(child: Container()),
          Text(
            title,
            style: TextStyles.semiBold16,
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }

  Widget _buildDividerLine() {
    return const Row(
      children: [
        Expanded(
            child: Divider(
          height: 10,
        )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Text(
            "أو",
            style: TextStyles.semiBold16,
          ),
        ),
        Expanded(
            child: Divider(
          height: 10,
        )),
      ],
    );
  }
}
