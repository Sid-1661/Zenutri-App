import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/common/presentation/utils/image_assets.dart';
import 'package:zenutri_app/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/common/presentation/widgets/svg_builder.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/orders/presentation/ui/screens/orders_screen.dart';
import 'package:zenutri_app/features/profile/presentation/ui/widgets/profile_option_item_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const SvgBuilder(
              path: ImageAssets.notificationSvg,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.rSp),
        child: Column(
          children: [
            ListTile(
              onTap: () {},
              leading: CircleAvatar(
                radius: 24.rSp,
                backgroundImage: const NetworkImage(
                  'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
                ),
              ),
              title: Text(
                'John Smith',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 20.rSp,
                    ),
              ),
              subtitle: Text(
                'john.smith@gmail.com',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.black,
                    ),
              ),
              trailing: CircleAvatar(
                radius: 17.rSp,
                backgroundColor: AppColors.antiFlashWhite,
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.black,
                  size: 18.rSp,
                ),
              ),
            ),
            verticalSpace(10),
            Divider(
              color: AppColors.antiFlashWhite,
              thickness: 1.rSp,
              height: 0,
            ),
            verticalSpace(10),
            ProfileOptionItemTile(
              imagePath: ImageAssets.orderSvg,
              title: 'My Order',
              onTap: () {
                Get.to(const OrdersScreen());
              },
            ),
            verticalSpace(10),
            ProfileOptionItemTile(
              imagePath: ImageAssets.favouriteSvg,
              title: 'Wishlist',
              onTap: () {},
            ),
            verticalSpace(10),
            Divider(
              color: AppColors.antiFlashWhite,
              thickness: 1.rSp,
              height: 0,
            ),
            verticalSpace(10),
            ProfileOptionItemTile(
              imagePath: ImageAssets.locationSvg,
              title: 'Saved Address',
              onTap: () {},
            ),
            verticalSpace(10),
            ProfileOptionItemTile(
              imagePath: ImageAssets.paymentCardSvg,
              title: 'Payments',
              onTap: () {},
            ),
            verticalSpace(10),
            Divider(
              color: AppColors.antiFlashWhite,
              thickness: 1.rSp,
              height: 0,
            ),
            verticalSpace(10),
            ProfileOptionItemTile(
              imagePath: ImageAssets.shippingCarSvg,
              title: 'Shipping and Payments',
              onTap: () {},
            ),
            verticalSpace(10),
            ProfileOptionItemTile(
              imagePath: ImageAssets.refundSvg,
              title: 'Refund Policy',
              onTap: () {},
            ),
            verticalSpace(10),
            Divider(
              color: AppColors.antiFlashWhite,
              thickness: 1.rSp,
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}

