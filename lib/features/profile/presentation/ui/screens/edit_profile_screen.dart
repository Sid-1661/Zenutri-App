import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_flutter/models/models.dart';
import 'package:zenutri_app/features/auth/presentation/state_holders/auth_controller.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/common/presentation/widgets/center_circular_progress_indicator.dart';
import 'package:zenutri_app/features/common/presentation/widgets/profile_avatar.dart';
import 'package:zenutri_app/features/profile/presentation/state_holders/update_profile_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final ShopifyUser? user = Get.find<AuthController>().shopifyUser;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _firstNameTEController =
      TextEditingController(text: user?.firstName);
  late final TextEditingController _lastNameTEController =
      TextEditingController(text: user?.lastName);
  late final TextEditingController _emailTEController =
      TextEditingController(text: user?.email);
  late final TextEditingController _phoneNumberTEController =
      TextEditingController(text: user?.phone);


  @override
  Widget build(BuildContext context) {
    print(user?.phone);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Edit'),
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
            child: IntrinsicHeight(
              child: profileEditForm,
            ),
          ),
        ),
      ),
    );
  }

  Form get profileEditForm {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          verticalSpace(32),
          ProfileAvatar(
            radius: 40.rSp,
          ),
          verticalSpace(32),
          TextFormField(
            controller: _emailTEController,
            enabled: false,
            decoration: const InputDecoration(hintText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          verticalSpace(16),
          TextFormField(
            controller: _firstNameTEController,
            decoration: const InputDecoration(hintText: 'First name'),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your first name';
              }
              return null;
            },
          ),
          verticalSpace(24),
          TextFormField(
            controller: _lastNameTEController,
            decoration: const InputDecoration(hintText: 'Last name'),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your last name';
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
          const Spacer(),
          SizedBox(
            width: 100.w,
            child: GetBuilder<UpdateProfileController>(
                builder: (controller) {
                  if (controller.inProgress) {
                    return const CenterCircularProgressLoader();
                  }
                  return ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final token = await Get.find<AuthController>().shopifyAuth.currentCustomerAccessToken ?? '';
                        controller.updateProfile(
                          _firstNameTEController.text.trim(),
                          _lastNameTEController.text.trim(),
                          _phoneNumberTEController.text.trim(),
                          token,
                          _emailTEController.text
                        ).then((value) {
                          if (value) {
                            Get.back();
                            Get.showSnackbar(
                              const GetSnackBar(
                                title: 'Profile Updated',
                                message: 'Profile has been updated successfully',
                                duration: Duration(seconds: 3),
                              ),
                            );
                          } else {
                            if (mounted) {
                              Get.showSnackbar(
                                GetSnackBar(
                                  title: 'Profile update failed',
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
