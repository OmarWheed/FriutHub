import 'package:flutter/material.dart';
import 'package:fruits_hub/config/routes/app_route_name.dart';
import 'package:fruits_hub/features/auth/presentation/views/login_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_up_view.dart';
import 'package:fruits_hub/features/onboarding/presentation/view/on_boarding_view.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_view.dart';

Route? onGenerateRoute(RouteSettings routes) {
  switch (routes.name) {
    case AppRouteName.splashView:
      return MaterialPageRoute(builder: (context) => SplashView());
    case AppRouteName.onBoarding:
      return MaterialPageRoute(builder: (context) => OnBoardingView());
    case AppRouteName.login:
      return MaterialPageRoute(builder: (context) => LoginView());
    case AppRouteName.signUp:
      return MaterialPageRoute(builder: (context) => SignUpView());
    default:
      return MaterialPageRoute(builder: (context) => _pageNotFoundBody());
  }
}

Widget _pageNotFoundBody() {
  return Scaffold(
    body: Center(
      child: Text(
        'Welcome to Fruits Hub this page NotFound',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  );
}
