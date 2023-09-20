import 'package:flutter/material.dart';
import 'package:zenutri_app/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/common/presentation/utils/image_assets.dart';
import 'package:zenutri_app/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: const BackButton(
          color: AppColors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.rw),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(6),
            Text('My Order', style: Theme.of(context).textTheme.titleLarge,),
            verticalSpace(3),
            Text('4 Orders', style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.shadowGray
            ),),
            verticalSpace(22),
            Text('Active', style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 22.rSp
            ),),
            verticalSpace(16),
            Container(
              padding: EdgeInsets.all(16.rSp),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.antiFlashWhite, width: 2.rSp),
                borderRadius: BorderRadius.circular(16.rSp)
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order No. 56987', style: Theme.of(context).textTheme.bodyLarge,),
                      verticalSpace(8),
                      Row(
                        children: [
                          Text('\$285.30 AUD', style: Theme.of(context).textTheme.bodySmall,),
                          horizontalSpace(4),
                          CircleAvatar(
                            backgroundColor: AppColors.shadowGray,
                            radius: 4.rSp,
                          ),
                          horizontalSpace(4),
                          Text('30 Sep', style: Theme.of(context).textTheme.bodySmall,),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 46.rSp,
                    height: 46.rSp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.rSp),
                      color: AppColors.teaGreen,
                      image: const DecorationImage(
                        image: AssetImage(ImageAssets.capsuleBgPng),
                      ),
                    ),
                  ),
                  horizontalSpace(6),
                  Container(
                    width: 46.rSp,
                    height: 46.rSp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.rSp),
                      color: AppColors.teaGreen,
                      image: const DecorationImage(
                        image: AssetImage(ImageAssets.capsuleBgPng),
                      ),
                    ),
                  ),
                  horizontalSpace(6),
                  CircleAvatar(
                    backgroundColor: AppColors.teaGreen,
                    child: Text('+2', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 15,
                      color: AppColors.black
                    ),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
