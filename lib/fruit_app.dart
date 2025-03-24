import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/config/routes/app_route_name.dart';
import 'package:fruits_hub/config/routes/generate_routes.dart';
import 'package:fruits_hub/config/theme/light_theme.dart';

//Start Point  App

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit App',
      theme: getLightTheme(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: AppRouteName.splashView,
    );
    //body
  }
}
