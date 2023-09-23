import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/features/common/presentation/utils/image_assets.dart';
import 'package:zenutri_app/features/common/presentation/widgets/svg_builder.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/auth/presentation/ui/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      goToWelcomeScreen();
    });
  }

  void goToWelcomeScreen() {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      Get.off(const WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSizes.screenWidth = size.width;
    ScreenSizes.screenHeight = size.height;
    return Scaffold(
      body: Center(
        child: SvgBuilder(
          path: ImageAssets.appLogoSvg,
          height: 208.rSp,
          width: 210.rSp,
        ),
      ),
    );
  }
}
