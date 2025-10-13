import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/config/routes/app_route_name.dart';
import 'package:fruits_hub/core/cubits/product_cubit/product_cubit.dart';
import 'package:fruits_hub/core/repos/product_repo.dart';
import 'package:fruits_hub/core/services/get_it_services.dart';
import 'package:fruits_hub/features/auth/domin/repo/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/sign_in_cubit/signin_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/sign_up_cubit/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_up_view.dart';
import 'package:fruits_hub/features/best_selling_fruits/presentation/views/best_selling_view.dart';
import 'package:fruits_hub/features/home/cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/details_view.dart';
import 'package:fruits_hub/features/home/presentation/views/app_section.dart';
import 'package:fruits_hub/features/home/presentation/views/product_view.dart';
import 'package:fruits_hub/features/onboarding/presentation/view/on_boarding_view.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_view.dart';

Route? onGenerateRoute(RouteSettings routes) {
  switch (routes.name) {
    case AppRouteName.splashView:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case AppRouteName.onBoarding:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case AppRouteName.login:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => SignInCubit(getIt<AuthRepo>()),
                child: const SignInView(),
              ));
    case AppRouteName.signUp:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => SignupCubit(getIt<AuthRepo>()),
          child: const SignUpView(),
        ),
      );
    case AppRouteName.  appSection:
      return MaterialPageRoute(
        builder: (context) => MultiBlocProvider(providers: [
          BlocProvider(
              create: (context) =>
                  ProductCubit(productRepo: getIt<ProductRepo>())),
          BlocProvider(create: (context) => CartCubit()),
        ], child: const AppSection()),
      );
    case ProductView.routeName:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
            create: (context) =>
                ProductCubit(productRepo: getIt<ProductRepo>()),
            child: const ProductView()),
      );
    case AppRouteName.bestSelling:
      return MaterialPageRoute(builder: (context) => const BestSellingView());
    case DetailsScreen.routeName:
      return MaterialPageRoute(builder: (context) => const DetailsScreen());
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
