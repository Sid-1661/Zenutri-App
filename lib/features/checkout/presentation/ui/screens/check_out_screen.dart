import 'package:flutter/material.dart';
import 'package:zenutri_app/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/common/presentation/utils/image_assets.dart';
import 'package:zenutri_app/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/common/presentation/widgets/svg_builder.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.rSp),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shipping address', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 20.rSp,
                  fontWeight: FontWeight.w600
                ),),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Add new',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                )
              ],
            ),
            Card(
              elevation: 0,
              margin: EdgeInsets.zero,
              color: AppColors.softWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.rSp)
              ),
              child: Padding(
                padding: EdgeInsets.all(24.rSp),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text('John Smith', style: Theme.of(context).textTheme.bodyLarge,)),
                        IconButton(
                            onPressed: () {},
                            icon: const SvgBuilder(
                              path: ImageAssets.editSvg,
                              color: AppColors.black,
                            ),
                        )
                      ],
                    ),
                    verticalSpace(18),
                    Row(
                      children: [
                        SvgBuilder(
                          path: ImageAssets.callSvg,
                          color: AppColors.black,
                          height: 16.rSp,
                          width: 16.rSp,
                        ),
                        horizontalSpace(8),
                        Expanded(
                          child: Text(
                            '+1 25654 5886',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: AppColors.shadowGray),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgBuilder(
                          path: ImageAssets.locationSvg,
                          color: AppColors.black,
                          height: 16.rSp,
                          width: 16.rSp,
                        ),
                        horizontalSpace(8),
                        Expanded(
                          child: Text(
                            '2896 Alexander Drive Wichita Falls, TX 76301',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: AppColors.shadowGray),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
