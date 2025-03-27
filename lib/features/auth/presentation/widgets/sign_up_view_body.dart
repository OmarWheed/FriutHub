import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/config/routes/app_route_name.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_Styles.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
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

  @override
  void initState() {
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
      child: Column(
        spacing: 16,
        children: [
          SizedBox(
            height: 24,
          ),
          CustomTextFormField(
              controller: _nameController, hintText: "الاسم كامل"),
          CustomTextFormField(
              controller: _emailController, hintText: "البريد الإلكتروني"),
          CustomTextFormField(
            controller: _passwordController,
            hintText: "كلمة المرور",
            obscureText: true,
            icon: Icon(
              Icons.visibility,
              color: AppColors.textColorInFormFiled,
            ),
          ),
          AgreeOfTermAndCondistion(),
          ElevatedButton(onPressed: () {}, child: Text("إنشاء حساب جديد")),
          _buildHadEmail()
        ],
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
