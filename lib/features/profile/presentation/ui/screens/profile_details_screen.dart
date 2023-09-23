import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/common/presentation/utils/image_assets.dart';
import 'package:zenutri_app/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/common/presentation/widgets/svg_builder.dart';
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
              CircleAvatar(
                radius: 42.rSp,
                backgroundImage: const NetworkImage(
                  'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
                ),
              ),
              verticalSpace(12),
              Text(
                'John Smith',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 28.rSp),
              ),
              verticalSpace(3),
              Text(
                'john.smith@gmail.com',
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
