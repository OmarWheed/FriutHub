import 'package:flutter/material.dart';
import 'package:fruits_hub/config/routes/app_route_name.dart';
import 'package:fruits_hub/config/routes/generate_routes.dart';

//Start Point  App

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: AppRouteName.splashView,
    );
    //body
  }
}
