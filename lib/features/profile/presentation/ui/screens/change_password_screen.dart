import 'package:flutter/material.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
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
            'Enter your old and new password to change the password.',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: AppColors.shadowGray),
          ),
          verticalSpace(32),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              hintText: 'Old password',
            ),
          ),
          verticalSpace(20),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              hintText: 'New password',
            ),
          ),
          verticalSpace(20),
          TextFormField(
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              hintText: 'Confirm New password',
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 100.w,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Update'),
            ),
          ),
          verticalSpace(24),
        ],
      ),
    );
  }
}
