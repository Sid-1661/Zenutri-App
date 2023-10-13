import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/auth/presentation/state_holders/forgot_password_controller.dart';
import 'package:zenutri_app/features/auth/presentation/ui/widgets/move_to_sign_up_text_button.dart';
import 'package:zenutri_app/features/auth/presentation/ui/widgets/zenutri_logo_horizontal.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/features/common/presentation/widgets/center_circular_progress_indicator.dart';
import 'package:zenutri_app/features/common/presentation/widgets/get_toast_message.dart';

class ForgotPasswordEmailScreen extends StatefulWidget {
  const ForgotPasswordEmailScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordEmailScreen> createState() => _ForgotPasswordEmailScreenState();
}

class _ForgotPasswordEmailScreenState extends State<ForgotPasswordEmailScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          Text('Reset Password', style: Theme.of(context).textTheme.titleLarge),
          verticalSpace(16),
          Text(
            'Enter your email address to get link for reset password.',
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
          sendEmailButton,
          verticalSpace(24),
          const MoveToSignUpTextButton()
        ],
      ),
    );
  }

  SizedBox get sendEmailButton {
    return SizedBox(
      width: 100.w,
      child: GetBuilder<ForgotPasswordController>(builder: (controller) {
        if (controller.inProgress) {
          return const CenterCircularProgressLoader();
        }
        return ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              controller
                  .sendResetPasswordEmail(_emailTEController.text.trim())
                  .then((value) {
                if (value) {
                  showGetSnackMessage(
                      'Reset Password', 'Reset password has been sent!');
                } else {
                  showGetSnackMessage(
                      'Reset password failed', controller.failure.message);
                }
              });
            }
          },
          child: const Text('Send email'),
        );
      }),
    );
  }
}