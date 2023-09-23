import 'package:flutter/material.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/common/presentation/utils/image_assets.dart';
import 'package:zenutri_app/features/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';

class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 313.rh,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.rSp),
        color: AppColors.teaGreen,
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -50,
            right: -50,
            child: Opacity(
              opacity: 0.5,
              child: Container(
                height: 200.rh,
                width: 300.rw,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageAssets.capsuleBgPng))),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24.rSp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(24),
                Text(
                  'Get your vitamins suggestion',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.primaryColor,
                      ),
                ),
                verticalSpace(12),
                Text(
                  'Answer some questions and get your recommendation',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.primaryColor,
                      ),
                ),
                verticalSpace(25),
                SizedBox(
                  width: 260.rw,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Recommend My Vitamins'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
