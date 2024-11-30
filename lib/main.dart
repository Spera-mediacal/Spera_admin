import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spera_admin_panel/app/routes/app_routes.dart';
import 'package:spera_admin_panel/utils/colors.dart';

import 'app/service/shared_pref_helper.dart';
import 'local/languages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Retrieve the saved language using SharedPrefHelper
  final String savedLocale = await SharedPrefHelper.getLanguage();

  runApp(MyApp(savedLocale: savedLocale));

  doWhenWindowReady(() {
    const initialSize = Size(1222, 700);
    appWindow.size = initialSize;
    appWindow.minSize = const Size(1400, 900);
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  final String savedLocale;

  const MyApp({super.key, required this.savedLocale});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Languages(),
      locale: Locale(savedLocale == "Arabic" ? 'ar' : 'en'),
      fallbackLocale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.accentColor),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.bgColor,
        fontFamily: 'Manjari',
      ),
      initialRoute: AppRoutes.loginViewPath,
      getPages: AppRoutes.getRoutes(),
    );
  }
}