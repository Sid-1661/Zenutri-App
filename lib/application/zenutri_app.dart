import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/application/themes/app_bar_themes.dart';
import 'package:zenutri_app/application/themes/app_decorations.dart';
import 'package:zenutri_app/application/themes/button_themes.dart';
import 'package:zenutri_app/application/themes/text_themes.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/auth/presentation/ui/screens/splash_screen.dart';

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
        textTheme: zenutriTextThemes,
        elevatedButtonTheme: ZenutriButtonThemes.elevatedButtonTheme,
        textButtonTheme: ZenutriButtonThemes.textButtonTheme,
        outlinedButtonTheme: ZenutriButtonThemes.outlinedButtonTheme,
        inputDecorationTheme: ZenutriAppDecorations.inputDecorationTheme,
        appBarTheme: appBarTheme,
      ),
      home: const SplashScreen(),
    );
  }
}
