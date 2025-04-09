import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_error_bar.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/sign_in_cubit/signin_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/widgets/sign_in_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "تسجيل دخول"),
      body: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInFailure) {
            buildErrorBar(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
              inAsyncCall: state is SignInLoading ? true : false,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: SignInViewBody(),
              ));
        },
      ),
    );
  }
}
