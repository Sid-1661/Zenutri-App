import 'package:flutter/material.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
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
      child: Column(
        children: [
          verticalSpace(32),
          Stack(
            children: [
              CircleAvatar(
                radius: 44.rSp,
                backgroundImage: const NetworkImage(
                  'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(15.rSp),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15.rSp),
                        border:
                            Border.all(color: AppColors.white, width: 2.rSp)),
                    child: CircleAvatar(
                      radius: 14.rSp,
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 16.rSp,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          verticalSpace(32),
          TextFormField(
            decoration: const InputDecoration(label: Text('Full Name')),
          ),
          verticalSpace(20),
          TextFormField(
            decoration: const InputDecoration(label: Text('Phone Number')),
          ),
          verticalSpace(20),
          TextFormField(
            decoration: InputDecoration(
              label: const Text('Email'),
              suffix: InkWell(
                child: Text(
                  'Verify',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.primaryColor
                  ),
                ),
              ),
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
