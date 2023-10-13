import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/application/themes/text_themes.dart';
import 'package:zenutri_app/features/auth/presentation/state_holders/auth_controller.dart';
import 'package:zenutri_app/features/common/presentation/utils/image_assets.dart';
import 'package:zenutri_app/features/common/presentation/widgets/svg_builder.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/auth/presentation/ui/screens/welcome_screen.dart';
import 'package:zenutri_app/features/dashboard/presentation/ui/screens/dashboard_main_nav_screen.dart';

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
      checkIfUserLoggedIn();
    });
  }

  void checkIfUserLoggedIn() {
    Future.delayed(const Duration(seconds: 2)).then((_) async {
      final bool result = await Get.find<AuthController>().checkIfLoggedIn();
      if (result) {
        Get.off(() => const DashboardMainNavScreen());
      } else {
        Get.off(() => const WelcomeScreen());
      }
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
