import 'package:flutter/material.dart';
import 'package:zenutri_app/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';

AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: AppColors.white,
  centerTitle: true,
  titleTextStyle: TextStyle(
      fontSize: 22.rSp,
      color: AppColors.black,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.35,
      fontFamily: 'Outfit'),
  elevation: 0,
);
