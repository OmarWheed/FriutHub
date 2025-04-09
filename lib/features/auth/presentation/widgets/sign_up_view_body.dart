import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/config/routes/app_route_name.dart';
import 'package:fruits_hub/core/helper/build_error_bar.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/core/widgets/password_field.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/sign_up_cubit/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/widgets/agree_terms.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _globalKey;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool _isAgreed = false;
  @override
  void initState() {
    _globalKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
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
            const SizedBox(
              height: 24,
            ),
            CustomTextFormField(
                controller: _nameController, hintText: "الاسم كامل"),
            CustomTextFormField(
                autoFillHints: AutofillHints.email,
                controller: _emailController,
                hintText: "البريد الإلكتروني"),
            PasswordField(
              controller: _passwordController,
            ),
            AgreeOfTermAndCondistion(
              onChange: (value) {
                _isAgreed = value;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  autovalidateMode = AutovalidateMode.onUserInteraction;
                  if (_globalKey.currentState!.validate()) {
                    _globalKey.currentState!.save();
                    if (_isAgreed) {
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text,
                              name: _nameController.text);
                    } else {
                      buildErrorBar(
                        context,
                        "يجب الموافقة على الشروط والأحكام",
                      );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                child: const Text("إنشاء حساب جديد")),
            _buildHadEmail()
          ],
        ),
      ),
    );
  }

  Widget _buildHadEmail() {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: "تمتلك حساب بالفعل؟ ",
          style: TextStyles.semiBold16
              .copyWith(color: AppColors.textColorInFormFiled)),
      TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.of(context).pushReplacementNamed(AppRouteName.login);
            },
          text: "تسجيل دخول",
          style: TextStyles.semiBold16.copyWith(color: AppColors.primaryColor)),
    ]));
  }
}
