import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shopify_flutter/shopify_flutter.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/product/pesentation/ui/screens/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ProductDetailsScreen(product: product,));
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
                image: DecorationImage(
                  image: NetworkImage(product.image),
                  fit: BoxFit.cover
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
                    product.title,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                      overflow: TextOverflow.ellipsis,
                        ),
                  ),
                  verticalSpace(4),
                  Text(
                    '\$${product.price} EAR',
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
