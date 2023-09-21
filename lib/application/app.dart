import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri/common/presentation/utils/app_colors.dart';
import 'package:zenutri/common/presentation/utils/size_extension.dart';
import 'package:zenutri/features/screen/splash.dart';
class ZenutriApp extends StatelessWidget {
  const ZenutriApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSizes.screenWidth = size.width;
    ScreenSizes.screenHeight = size.height;
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: MaterialColor(
          AppColors.primaryColor.value,
          AppColors.colorPalette,
        ),
        fontFamily: 'Outfit',
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            letterSpacing: 0.5,
            fontSize: 14.rSp
          ),
          bodyLarge: TextStyle(
            letterSpacing: 0.5,
            fontSize: 17.rSp
          ),
          titleLarge: TextStyle(
            fontSize: 32.rSp,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.37,
          ),
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
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(
                fontSize: 17.rSp,
                color: AppColors.white,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5
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
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: AppColors.graniteGray),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
