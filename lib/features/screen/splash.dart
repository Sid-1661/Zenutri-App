import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zenutri/common/presentation/utils/image_assets.dart';
import 'package:zenutri/common/presentation/utils/size_extension.dart';
import 'package:zenutri/features/screen/signup.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
    child: SvgPicture.asset(
      ImageAssets.splash,
      width: 100.w,
      height: 100.h,
    ),
  ),

      nextScreen: signup(),
      duration: 2000,
      
      );
  }
}