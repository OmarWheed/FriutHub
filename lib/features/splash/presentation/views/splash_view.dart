import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/config/routes/app_route_name.dart';
import 'package:fruits_hub/core/utils/app_assets_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    _executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _splashViewBody(),
    );
  }

  Widget _splashViewBody() {
    return Stack(
      children: [
        Positioned(child: SvgPicture.asset(AppImageName.splashPlant)),
        Center(
          child: SvgPicture.asset(AppImageName.splashLogo),
        ),
        Positioned(
          bottom: 1,
          child: SvgPicture.asset(
            AppImageName.splashCircles,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }

  void _executeNavigation() {
    // Simulate navigation after 3 seconds
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed(AppRouteName.onBoarding);
    });
  }
}
