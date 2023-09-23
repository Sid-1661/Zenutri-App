import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/common/presentation/widgets/custom_stepper.dart';
import 'package:zenutri_app/features/product/pesentation/ui/widgets/product_image_slider.dart';
import 'package:zenutri_app/features/review/presentation/ui/widgets/product_review_card.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ProductImageSlider(),
                        productDetailsAppBar,
                      ],
                    ),
                    productDetailsBody,
                    productReviewSection
                  ],
                ),
              ),
            ),
            bottomCartButtonBar
          ],
        ),
      ),
    );
  }

  Padding get productReviewSection {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.rw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(32),
          Text(
            'Review(10)',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
          verticalSpace(17),
          ListView.separated(
            primary: false,
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const ProductReviewCard();
            },
            separatorBuilder: (BuildContext context, int index) {
              return verticalSpace(24);
            },
          ),
        ],
      ),
    );
  }

  Padding get productDetailsBody {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.rSp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(32),
          Text(
            'For Her Bundle',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 22.rSp),
          ),
          verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$95.10 AUD',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 16.rSp, color: AppColors.shadowGray),
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  RatingBarIndicator(
                    rating: 0.5,
                    unratedColor: AppColors.eerieBlack.withOpacity(0.2),
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 1,
                    itemSize: 24.rSp,
                    direction: Axis.horizontal,
                  ),
                  Text(
                    '(120)',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16.rSp,
                        color: AppColors.eerieBlack.withOpacity(0.5)),
                  ),
                ],
              )
            ],
          ),
          verticalSpace(22),
          ExpansionTile(
            title: Text(
              'Description',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: AppColors.black),
            ),
            tilePadding: EdgeInsets.zero,
            collapsedShape: Border(
                bottom: BorderSide(color: AppColors.aluminium, width: 0.5.rSp)),
            iconColor: AppColors.aluminium,
            children: const [
              Text(
                  '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                            ''')
            ],
          ),
          ExpansionTile(
            title: Text(
              'What’s included',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: AppColors.black),
            ),
            tilePadding: EdgeInsets.zero,
            collapsedShape: Border(
                bottom: BorderSide(color: AppColors.aluminium, width: 0.5.rSp)),
            iconColor: AppColors.aluminium,
            children: const [
              Text(
                  '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                            ''')
            ],
          ),
        ],
      ),
    );
  }

  Container get bottomCartButtonBar {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.rw, vertical: 12.rh),
      child: Row(
        children: [
          CustomStepper(
            lowerLimit: 1,
            upperLimit: 20,
            stepValue: 1,
            value: 1,
            onChange: (int newValue) {},
          ),
          horizontalSpace(12),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add to Cart'),
            ),
          )
        ],
      ),
    );
  }

  AppBar get productDetailsAppBar {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const BackButton(
        color: AppColors.shadowGray,
      ),
      actions: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              color: AppColors.shadowGray,
            ),
          ),
        ),
        horizontalSpace(16),
      ],
    );
  }
}