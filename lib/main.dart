import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_admin_panel/app/routes/app_routes.dart';
import 'package:spera_admin_panel/utils/colors.dart';

void main() {
  runApp(const MyApp());

  doWhenWindowReady(() {
    const initialSize = Size(1024, 1000);
    appWindow.size = initialSize;
    appWindow.minSize = const Size(1400, 900);
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
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
