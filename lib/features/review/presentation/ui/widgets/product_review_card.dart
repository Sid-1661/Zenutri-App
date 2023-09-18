import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:zenutri_app/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';

class ProductReviewCard extends StatelessWidget {
  const ProductReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 17.rSp,
          backgroundColor: AppColors.primaryColor,
          backgroundImage: const NetworkImage(
              'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250'),
        ),
        horizontalSpace(10),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Mark Zenderman',
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  RatingBarIndicator(
                    rating: 3.4,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 18.rSp,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
              verticalSpace(4),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.shadowGray, fontSize: 15.rSp),
              )
            ],
          ),
        )
      ],
    );
  }
}
