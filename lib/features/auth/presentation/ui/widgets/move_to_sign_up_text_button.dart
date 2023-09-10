import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/auth/presentation/ui/screen/signup_screen.dart';

class MoveToSignUpTextButton extends StatelessWidget {
  const MoveToSignUpTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Get.off(const SignUpScreen());
        },
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.eerieBlack,
                  fontWeight: FontWeight.w400,
                ),
            children: [
              const TextSpan(text: 'Don’t have an account yet? '),
              TextSpan(
                text: 'Sign up',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
