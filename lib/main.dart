import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/services/shared_prefs.dart';
import 'package:fruits_hub/fruit_app.dart';

//TODO : DO INIT FUNCTIONS TO ALL INITIALIZATION FUNCTION
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Prefs.init();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('ar')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('ar'),
        child: FruitApp()),
  );
}
