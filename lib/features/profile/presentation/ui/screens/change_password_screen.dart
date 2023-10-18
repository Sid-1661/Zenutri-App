import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/features/auth/presentation/state_holders/auth_controller.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/common/presentation/widgets/center_circular_progress_indicator.dart';
import 'package:zenutri_app/features/profile/presentation/state_holders/change_password_controller.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: false,
        leading: const BackButton(
          color: AppColors.black,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.rSp),
          child: Container(
            color: AppColors.antiFlashWhite,
            height: 1.rSp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.rSp),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 100.w,
              minHeight: 85.h,
            ),
            child: IntrinsicHeight(child: changePasswordForm),
          ),
        ),
      ),
    );
  }

  Form get changePasswordForm {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(24),
          Text(
            'Change Password',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 34.rSp),
          ),
          verticalSpace(18),
          Text(
            'Enter your new password to change the password.',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: AppColors.shadowGray),
          ),
          verticalSpace(32),
          TextFormField(
            controller: _passwordTEController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              hintText: 'New password',
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
          verticalSpace(20),
          TextFormField(
            controller: _confirmTEController,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              hintText: 'Confirm New password',
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
            child: GetBuilder<ChangePasswordController>(
              builder: (controller) {
                if (controller.inProgress) {
                  return const CenterCircularProgressLoader();
                }
                return ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final token = await Get.find<AuthController>().shopifyAuth.currentCustomerAccessToken ?? '';
                      final email = Get.find<AuthController>().shopifyUser?.email ?? '';
                      controller.changePassword(
                        _passwordTEController.text.trim(),
                        token,
                        email
                      ).then((value) {
                        if (value) {
                          Get.back();
                          Get.showSnackbar(
                            const GetSnackBar(
                              title: 'Password changed',
                              message: 'Password has been changed successfully',
                              duration: Duration(seconds: 3),
                            ),
                          );
                        } else {
                          if (mounted) {
                            Get.showSnackbar(
                              GetSnackBar(
                                title: 'Password change failed',
                                message: controller.failure.message,
                                duration: const Duration(seconds: 3),
                              ),
                            );
                          }
                        }
                      });
                    }
                  },
                  child: const Text('Update'),
                );
              }
            ),
          ),
          verticalSpace(24),
        ],
      ),
    );
  }
}
