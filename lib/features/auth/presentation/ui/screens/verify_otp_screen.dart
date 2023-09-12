import 'package:flutter/material.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:zenutri_app/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/common/presentation/utils/spacing.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  OtpTimerButtonController controller = OtpTimerButtonController();


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
            Text('Verify your phone number',
                style: Theme.of(context).textTheme.titleLarge),
            verticalSpace(16),
            Text(
              'We have send a verification code to your email. Please and very.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.shadowGray,
                  ),
            ),
            verticalSpace(24),
            PinCodeTextField(
              length: 4,
              obscureText: false,
              animationType: AnimationType.fade,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              keyboardType: TextInputType.number,
              controller: _otpTEController,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(50.rSp),
                fieldHeight: 45.rSp,
                fieldWidth: 60.rSp,
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                selectedFillColor: Colors.white,
                inactiveColor: AppColors.manatee,
                activeColor: AppColors.primaryColor,
              ),
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.white,
              enableActiveFill: true,
              beforeTextPaste: (text) {
                return true;
              },
              appContext: context,
            ),
            verticalSpace(12),
            Center(child: OtpTimerButton(
              controller: controller,
              onPressed: () {
                controller.startTimer();
              },
              text: const Text('Resend OTP', style: TextStyle(
                fontWeight: FontWeight.w700
              ),),
              duration: 30,
              buttonType: ButtonType.text_button,
            ),
            ),
            const Spacer(),
            SizedBox(
              width: 100.w,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Verify Now'),
              ),
            ),
          ],
        ),
      );
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }
}