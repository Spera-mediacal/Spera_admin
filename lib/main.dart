import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_admin_panel/app/routes/app_roustes.dart';
import 'package:spera_admin_panel/utils/colors.dart';

void main() {
  runApp(const MyApp());
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
        fontFamily:'Manjari'
      ),
      initialRoute: AppRoutes.loginViewPath,

      getPages: AppRoutes.getRoutes(),
    );
  }
}

