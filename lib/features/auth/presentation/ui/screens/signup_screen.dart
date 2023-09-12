import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/auth/presentation/ui/screens/verify_otp_screen.dart';
import 'package:zenutri_app/features/auth/presentation/ui/widgets/move_to_login_text_button.dart';
import 'package:zenutri_app/features/auth/presentation/ui/widgets/zenutri_logo_horizontal.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obscureConfirmPassword = true;
  bool obscurePassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _phoneNumberTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmTEController = TextEditingController();
  final RegExp emailValidationRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.rSp),
            child: mainFormBody,
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
          const ZenutriLogoHorizontal(),
          verticalSpace(48),
          Text('Sign Up', style: Theme.of(context).textTheme.titleLarge),
          verticalSpace(16),
          Text(
            'To continue, please create an account.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.shadowGray,
                ),
          ),
          verticalSpace(24),
          TextFormField(
            controller: _fullNameTEController,
            decoration: const InputDecoration(hintText: 'Full name'),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your full name';
              }
              return null;
            },
          ),
          verticalSpace(16),
          TextFormField(
            controller: _emailTEController,
            decoration: const InputDecoration(hintText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your valid email here';
              } else if (!emailValidationRegex.hasMatch(value ?? '')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          verticalSpace(16),
          TextFormField(
            controller: _phoneNumberTEController,
            decoration: const InputDecoration(hintText: 'Phone number'),
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your phone number';
              }
              return null;
            },
          ),
          verticalSpace(16),
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
          verticalSpace(40),
          SizedBox(
            width: 100.w,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  Get.to(
                    const VerifyOtpScreen(
                      screenType: VerifyOtpScreenType.signUp,
                    ),
                  );
                }
              },
              child: const Text('Create Account'),
            ),
          ),
          verticalSpace(24),
          const MoveToLoginTextButton()
        ],
      ),
    );
  }

  @override
  void dispose() {
    _fullNameTEController.dispose();
    _emailTEController.dispose();
    _phoneNumberTEController.dispose();
    _passwordTEController.dispose();
    _confirmTEController.dispose();
    super.dispose();
  }
}

