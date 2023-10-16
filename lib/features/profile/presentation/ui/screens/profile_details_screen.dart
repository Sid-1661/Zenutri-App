import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/features/auth/presentation/state_holders/auth_controller.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/common/presentation/utils/image_assets.dart';
import 'package:zenutri_app/features/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/features/common/presentation/widgets/profile_avatar.dart';
import 'package:zenutri_app/features/common/presentation/widgets/svg_builder.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/profile/presentation/ui/screens/change_password_screen.dart';
import 'package:zenutri_app/features/profile/presentation/ui/screens/edit_profile_screen.dart';
import 'package:zenutri_app/features/profile/presentation/ui/widgets/profile_option_item_tile.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const SvgBuilder(
              path: ImageAssets.notificationSvg,
            ),
          ),
        ],
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
          child: Column(
            children: [
              verticalSpace(32),
              ProfileAvatar(
                radius: 32.rSp,
              ),
              verticalSpace(12),
              Text(
                Get.find<AuthController>().userFullName,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 28.rSp),
              ),
              verticalSpace(3),
              Text(
                Get.find<AuthController>().shopifyUser?.email ?? '',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              verticalSpace(32),
              ProfileOptionItemTile(
                imagePath: ImageAssets.profileSvg,
                title: 'Edit Profile',
                onTap: () {
                  Get.to(const EditProfileScreen());
                },
              ),
              verticalSpace(10),
              ProfileOptionItemTile(
                imagePath: ImageAssets.lockSvg,
                title: 'Change Password',
                onTap: () {
                  Get.to(const ChangePasswordScreen());
                },
              ),
              verticalSpace(10),
              Divider(
                color: AppColors.antiFlashWhite,
                thickness: 1.rSp,
                height: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
