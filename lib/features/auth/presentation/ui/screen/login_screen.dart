import 'package:flutter/material.dart';
import 'package:zenutri_app/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/auth/presentation/widgets/zenutri_logo_horizontal.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(56),
          const ZenutriLogoHorizontal(),
          verticalSpace(48),
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
            decoration: const InputDecoration(hintText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          verticalSpace(16),
          TextFormField(
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
                onPressed: () {},
                child: const Text('Forgot Password?'),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 100.w,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Login'),
            ),
          ),
          verticalSpace(24),
          Center(
            child: GestureDetector(
              onTap: () {},
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
          )
        ],
      ),
    );
  }
}