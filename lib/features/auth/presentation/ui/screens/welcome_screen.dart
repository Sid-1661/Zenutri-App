import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/common/presentation/utils/image_assets.dart';
import 'package:zenutri_app/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/auth/presentation/ui/screens/login_screen.dart';
import 'package:zenutri_app/features/auth/presentation/ui/screens/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.honeydew,
      body: Stack(
        children: [
          backImageWithShaderMask,
          mainContent,
        ],
      ),
    );
  }

  /// main body content
  Widget get mainContent {
    return Padding(
      padding: EdgeInsets.all(16.rSp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to',
            style: TextStyle(
                color: AppColors.black,
                fontSize: 43.rSp,
                fontWeight: FontWeight.w400),
          ),
          Text(
            'ZENUTRI',
            style: TextStyle(
                color: AppColors.black,
                fontSize: 43.rSp,
                fontWeight: FontWeight.w700),
          ),
          verticalSpace(16),
          Text(
            'Please login or signup to continue.',
            style: TextStyle(fontSize: 16.rSp, color: AppColors.graniteGray),
          ),
          verticalSpace(40),
          SizedBox(
            width: 100.w,
            child: ElevatedButton(
              onPressed: () {
                Get.to(const LoginScreen());
              },
              child: const Text('Login'),
            ),
          ),
          verticalSpace(12),
          SizedBox(
            width: 100.w,
            child: OutlinedButton(
              onPressed: () {
                Get.to(const SignUpScreen());
              },
              child: const Text('Sign up'),
            ),
          ),
        ],
      ),
    );
  }

  /// background image with shader-mask
  ShaderMask get backImageWithShaderMask {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [AppColors.honeydew, Colors.transparent],
        ).createShader(
          Rect.fromLTRB(0, 0, rect.width, rect.height),
        );
      },
      blendMode: BlendMode.dstIn,
      child: Image.asset(
        ImageAssets.welcomeBg,
        width: 100.w,
        fit: BoxFit.cover,
      ),
    );
  }
}
