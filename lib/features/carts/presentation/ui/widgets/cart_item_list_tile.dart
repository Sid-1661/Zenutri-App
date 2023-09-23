import 'package:flutter/material.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/common/presentation/utils/image_assets.dart';
import 'package:zenutri_app/features/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/common/presentation/widgets/custom_stepper.dart';

class CartItemListTile extends StatelessWidget {
  const CartItemListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 65.rw,
          height: 48.rh,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.rSp),
              color: AppColors.teaGreen,
              image: const DecorationImage(
                  image: AssetImage(ImageAssets.capsuleBgPng))),
        ),
        horizontalSpace(8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'For Her Bundle',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
              ),
              verticalSpace(4),
              Text(
                '\$95.10 AUD',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.shadowGray),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 44.rh,
          width: 97.rw,
          child: FittedBox(
            child: CustomStepper(
              lowerLimit: 1,
              upperLimit: 10,
              stepValue: 1,
              value: 1,
              onChange: (int v) {},
            ),
          ),
        ),
      ],
    );
  }
}
