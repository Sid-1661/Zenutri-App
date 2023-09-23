import 'package:flutter/material.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/features/common/presentation/widgets/svg_builder.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';

class ProfileOptionItemTile extends StatelessWidget {
  const ProfileOptionItemTile({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  final String title, imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.rh),
        child: Row(
          children: [
            SvgBuilder(
              path: imagePath,
              height: 24.rSp,
              width: 24.rSp,
            ),
            horizontalSpace(16),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 16.rSp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
              ),
            ),
            horizontalSpace(8),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.black,
              size: 18.rSp,
            ),
          ],
        ),
      ),
    );
  }
}
