import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/auth/presentation/ui/screen/splash_screen.dart';

class ZenutriApp extends StatelessWidget {
  const ZenutriApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: MaterialColor(
          AppColors.primaryColor.value,
          AppColors.colorPalette,
        ),
        fontFamily: 'Outfit',
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            letterSpacing: 0.5
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            textStyle: const TextStyle(
                fontSize: 16,
                color: AppColors.white,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 32,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: AppColors.primaryColor,
              width: 2,
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              color: AppColors.white,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 32,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
