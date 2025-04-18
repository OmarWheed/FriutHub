import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/config/routes/app_route_name.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/core/widgets/password_field.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/sign_in_cubit/signin_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/widgets/custom_button_with_icon.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  late TextEditingController _emailController;
  late final GlobalKey<FormState> _globalKey;
  late TextEditingController _passwordController;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    _globalKey = GlobalKey();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        autovalidateMode: autovalidateMode,
        key: _globalKey,
        child: Column(
          spacing: 16,
          children: [
            CustomTextFormField(
                autoFillHints: AutofillHints.email,
                controller: _emailController,
                hintText: "البريد الإلكتروني"),
            PasswordField(
              controller: _passwordController,
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
            const SizedBox(height: 14),
            ElevatedButton(
                onPressed: () {
                  autovalidateMode = AutovalidateMode.onUserInteraction;
                  if (_globalKey.currentState!.validate()) {
                    _globalKey.currentState!.save();
                    context.read<SignInCubit>().signIn(
                        email: _emailController.text,
                        password: _passwordController.text);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                child: const Text(
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
                      Navigator.of(context).pushNamed(AppRouteName.signUp);
                    },
                  text: " قم بأنشاء حساب",
                  style: TextStyles.semiBold16
                      .copyWith(color: AppColors.buttonColor)),
            ])),
            const SizedBox(height: 14),
            _buildDividerLine(),
            const SizedBox(height: 14),
            CustomButtonWithIcon(
              title: "تسجيل بواسطة جوجل",
              logo: Assets.googleLogo,
              onTap: () {
                context.read<SignInCubit>().signInWithGoogle();
              },
            ),
            //TODO: This Feature not work Yet because I don't have Mac
            Visibility(
              maintainAnimation: false,
              maintainState: false,
              maintainSize: false,
              maintainSemantics: false,
              visible: Platform.isIOS ? true : false,
              child: CustomButtonWithIcon(
                title: "تسجيل بواسطة أبل",
                logo: Assets.appleLogo,
                onTap: () {},
              ),
            ),
            CustomButtonWithIcon(
              title: "تسجيل بواسطة فيسبوك",
              logo: Assets.facebookLogo,
              onTap: () {
                context.read<SignInCubit>().signInWithFacebook();
              },
            )
          ],
        ),
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
