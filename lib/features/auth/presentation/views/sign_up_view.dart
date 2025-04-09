import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_error_bar.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/sign_up_cubit/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/widgets/sign_up_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "حساب جديد"),
      body: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupFailure) {
            buildErrorBar(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is SignupLoading ? true : false,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SignUpViewBody(),
            ),
          );
        },
      ),
    );
  }
}
