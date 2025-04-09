import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/config/routes/app_route_name.dart';
import 'package:fruits_hub/core/services/shared_prefs.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/pref_keys.dart';

//TODO: Change This Page And Use flutter_native_splash
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
        Positioned(
            left: 0,
            child: SvgPicture.asset(
              Assets.splashPlant,
            )),
        Center(
          child: SvgPicture.asset(Assets.splashLogo),
        ),
        Positioned(
          bottom: 1,
          child: SvgPicture.asset(
            Assets.splashCircles,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }

  void _executeNavigation() {
    // Simulate navigation after 3 seconds
    Future.delayed(const Duration(seconds: 5), () {
      if (Prefs.getBool(key: PrefKeys.isOnBoardingSeen)) {
        Navigator.of(context).pushReplacementNamed(AppRouteName.login);
      } else {
        Navigator.of(context).pushReplacementNamed(AppRouteName.onBoarding);
      }
    });
  }
}
