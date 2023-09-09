import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zenutri_app/core/colors/app_colors.dart';
import 'package:zenutri_app/features/auth/presentation/ui/screen/splash_screen.dart';

class ZenutriApp extends StatelessWidget {
  const ZenutriApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: MaterialColor(
              AppColors.primaryColor.value,
              AppColors.colorPalette,
            ),
            fontFamily: 'Outfit',
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 32,
                ),
              ),
            ),
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
