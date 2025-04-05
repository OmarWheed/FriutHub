import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/config/routes/app_route_name.dart';
import 'package:fruits_hub/core/services/get_it_services.dart';
import 'package:fruits_hub/features/auth/domin/repo/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/cubit/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/login_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_up_view.dart';
import 'package:fruits_hub/features/onboarding/presentation/view/on_boarding_view.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_view.dart';

Route? onGenerateRoute(RouteSettings routes) {
  switch (routes.name) {
    case AppRouteName.splashView:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case AppRouteName.onBoarding:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case AppRouteName.login:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case AppRouteName.signUp:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => SignupCubit(getIt<AuthRepo>()),
          child: const SignUpView(),
        ),
      );
    default:
      return MaterialPageRoute(builder: (context) => _pageNotFoundBody());
  }
}

Widget _pageNotFoundBody() {
  return const Scaffold(
    body: Center(
      child: Text(
        'Welcome to Fruits Hub this page NotFound',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  );
}
