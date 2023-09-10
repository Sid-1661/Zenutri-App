import 'package:flutter/material.dart';
import 'package:zenutri_app/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/common/presentation/utils/spacing.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(72),
              Text('Verify your email', style: Theme.of(context).textTheme.titleLarge),
              verticalSpace(16),
              Text(
                'We have send a verification code to your email. Please and very.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.shadowGray,
                ),
              ),
              verticalSpace(24),
            ],
          ),
        ),
      ),
    );
  }
}
