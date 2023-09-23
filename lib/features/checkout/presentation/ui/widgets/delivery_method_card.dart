import 'package:flutter/material.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/features/common/presentation/widgets/svg_builder.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';

class DeliveryMethodCard extends StatelessWidget {
  const DeliveryMethodCard({
    super.key,
    required this.image,
    required this.days,
    required this.selected,
  });

  final String image;
  final String days;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.rSp),
        border: Border.all(
          color: selected ? AppColors.primaryColor : AppColors.honeydew,
          width: selected ? 2.rSp : 1.rSp,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.rSp),
        child: Column(
          children: [
            SvgBuilder(
              path: image,
              width: 79.rw,
              height: 24.rh,
            ),
            verticalSpace(4),
            Text(
              '$days days',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.shadowGray),
            ),
          ],
        ),
      ),
    );
  }
}
