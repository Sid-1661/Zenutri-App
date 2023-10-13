import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/features/auth/presentation/state_holders/sign_in_controller.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/auth/presentation/ui/screens/verify_otp_screen.dart';
import 'package:zenutri_app/features/auth/presentation/ui/widgets/move_to_sign_up_text_button.dart';
import 'package:zenutri_app/features/auth/presentation/ui/widgets/zenutri_logo_horizontal.dart';
import 'package:zenutri_app/features/common/presentation/widgets/center_circular_progress_indicator.dart';
import 'package:zenutri_app/features/common/presentation/widgets/get_toast_message.dart';
import 'package:zenutri_app/features/dashboard/presentation/ui/screens/dashboard_main_nav_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16.rSp),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 100.w,
                minHeight: 85.h,
              ),
              child: IntrinsicHeight(
                child: mainFormBody,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// main form body
  Form get mainFormBody {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(56),
          ZenutriLogo(
            width: 122.rSp,
            height: 121.rSp,
          ),
          verticalSpace(24),
          Text('Login', style: Theme.of(context).textTheme.titleLarge),
          verticalSpace(16),
          Text(
            'Please login  to continue.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.shadowGray,
                ),
          ),
          verticalSpace(24),
          TextFormField(
            controller: _emailTEController,
            decoration: const InputDecoration(hintText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          verticalSpace(16),
          TextFormField(
            controller: _passwordTEController,
            obscureText: obscurePassword,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: IconButton(
                onPressed: () {
                  obscurePassword = !obscurePassword;
                  if (mounted) {
                    setState(() {});
                  }
                },
                icon: Icon(obscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Get.to(
                    const VerifyOtpScreen(
                        screenType: VerifyOtpScreenType.resetPassword,
                    ),
                  );
                },
                child: const Text('Forgot Password?'),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 100.w,
            child: GetBuilder<SignInController>(
              builder: (controller) {
                if (controller.inProgress) {
                  return const CenterCircularProgressLoader();
                }
                return ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.signIn(
                        _emailTEController.text.trim(),
                        _passwordTEController.text.trim(),
                      ).then((value) {
                        if (value) {
                          Get.offAll(() => const DashboardMainNavScreen(),);
                        } else {
                          showGetSnackMessage('Login failed', controller.failure.message);
                        }
                      });
                    }
                  },
                  child: const Text('Login'),
              );
            }),
          ),
          verticalSpace(24),
          const MoveToSignUpTextButton()
        ],
      ),
    );
  }


}