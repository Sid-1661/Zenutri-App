import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/common/presentation/utils/image_assets.dart';
import 'package:zenutri_app/features/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/product/pesentation/ui/screens/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(const ProductDetailsScreen());
      },
      borderRadius: BorderRadius.circular(16.rSp),
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.rSp)),
        child: Column(
          children: [
            Container(
              height: 131.rh,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.rSp),
                  topRight: Radius.circular(16.rSp),
                ),
                color: AppColors.teaGreen.withOpacity(0.5),
                image: const DecorationImage(
                  image: AssetImage(ImageAssets.appLogoVertical),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.rSp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: 3.4,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 16.rSp,
                        direction: Axis.horizontal,
                      ),
                      horizontalSpace(4),
                      Text(
                        '(3.4)',
                        style: TextStyle(
                            color: AppColors.eerieBlack, fontSize: 10.rSp),
                      )
                    ],
                  ),
                  verticalSpace(4),
                  Text(
                    'For Her Bundle',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
          ],
        ),
      ),
    );
  }
}
