import 'package:flutter/material.dart';
import 'package:fruits_hub/features/onboarding/presentation/view/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: OnBoardingViewBody()),
      
    );

  }
}
