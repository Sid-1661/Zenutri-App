import 'package:flutter/material.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';

class ZenutriButtonThemes {
  /// Elevated button theme
  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      textStyle: TextStyle(
        fontSize: 16.rSp,
        color: AppColors.white,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
        fontFamily: 'Outfit',
      ),
      padding: EdgeInsets.symmetric(
        vertical: 16.rh,
        horizontal: 32.rw,
      ),
    ),
  );

  /// Text button theme data
  static TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: TextStyle(
        fontSize: 17.rSp,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        fontFamily: 'Outfit',
      ),
    ),
  );

  /// Outlined button theme data
  static OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(
        color: AppColors.primaryColor,
        width: 2,
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        color: AppColors.white,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
        fontFamily: 'Outfit',
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 32,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
  );
}
