import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_management_app/configs/localizations/app_locale.dart';
import 'package:task_management_app/configs/pages/page.dart';
import 'package:task_management_app/configs/themes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(391, 852),
      builder: (_, child) {
        return GetMaterialApp(
          // =================== THEME =======================
          theme: AppTheme().lightThemeData(context),
          darkTheme: AppTheme().darkThemeData(context),
          themeMode: ThemeMode.dark,
          // =================== LOCALIZATION =======================
          translations: AppLocale(),
          locale: Get.deviceLocale,
          fallbackLocale: Locale('en', 'US'),
          // =================== DEBUG =======================
          debugShowCheckedModeBanner: false,
          // =================== ROUTE =======================
          initialRoute: CustomPage.initial,
          getPages: CustomPage.routes,
        );
      },
    );
  }
}
