import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/auth/presentation/ui/widgets/move_to_sign_up_text_button.dart';
import 'package:zenutri_app/features/dashboard/presentation/ui/screens/dashboard_main_nav_screen.dart';

class ResetNewPasswordScreen extends StatefulWidget {
  const ResetNewPasswordScreen({super.key});

  @override
  State<ResetNewPasswordScreen> createState() => _ResetNewPasswordScreenState();
}

class _ResetNewPasswordScreenState extends State<ResetNewPasswordScreen> {
  bool obscureConfirmPassword = true, obscurePassword = true;
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmTEController = TextEditingController();

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
                minHeight: 90.h,
              ),
              child: IntrinsicHeight(
                child: mainBody,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get mainBody {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(72),
            Text('Set new password',
                style: Theme.of(context).textTheme.titleLarge),
            verticalSpace(16),
            Text(
              'Enter your password to set new one.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.shadowGray,
                  ),
            ),
            verticalSpace(24),
            TextFormField(
              controller: _passwordTEController,
              obscureText: obscurePassword,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
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
                      : Icons.visibility_outlined,
                  ),
                ),
              ),
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'Enter your password';
                } else if ((value?.length ?? 0) < 6) {
                  return 'Password should be more that 6 letters';
                }
                return null;
              },
            ),
            verticalSpace(16),
            TextFormField(
              controller: _confirmTEController,
              obscureText: obscureConfirmPassword,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: 'Confirm Password',
                suffixIcon: IconButton(
                  onPressed: () {
                    obscureConfirmPassword = !obscureConfirmPassword;
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  icon: Icon(obscureConfirmPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  ),
                ),
              ),
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'Enter your confirm password';
                } else if (value != _passwordTEController.text) {
                  return 'Confirm password does n\'t match';
                }
                return null;
              },
            ),
            const Spacer(),
            SizedBox(
              width: 100.w,
              child: ElevatedButton(
                onPressed: () {
                  Get.offAll(const DashboardMainNavScreen());
                },
                child: const Text('Confirm'),
              ),
            ),
            verticalSpace(24),
            const MoveToSignUpTextButton(),
          ],
        ),
      );
  }

  @override
  void dispose() {
    _confirmTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}