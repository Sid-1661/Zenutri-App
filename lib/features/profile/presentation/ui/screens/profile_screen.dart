import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_flutter/models/src/address_autocomplete/address_details/address_details.dart';
import 'package:zenutri_app/features/address_list/pesentation/ui/screens/address_list_screen.dart';
import 'package:zenutri_app/features/auth/presentation/state_holders/auth_controller.dart';
import 'package:zenutri_app/features/auth/presentation/ui/screens/welcome_screen.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/common/presentation/utils/image_assets.dart';
import 'package:zenutri_app/features/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/features/common/presentation/widgets/profile_avatar.dart';
import 'package:zenutri_app/features/common/presentation/widgets/svg_builder.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/dashboard/presentation/controllers/dashboard_bottom_nav_controller.dart';
import 'package:zenutri_app/features/orders/presentation/ui/screens/orders_screen.dart';
import 'package:zenutri_app/features/profile/presentation/ui/screens/profile_details_screen.dart';
import 'package:zenutri_app/features/profile/presentation/ui/widgets/profile_option_item_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<DashboardBottomNavController>().back();
        return false;
      },
      child: Scaffold(
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
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.rSp),
            child: Container(
              color: AppColors.antiFlashWhite,
              height: 1.rSp,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.rSp),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  Get.to(const ProfileDetailsScreen());
                },
                leading: const ProfileAvatar(),
                title: Text(
                  Get.find<AuthController>().userFullName,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 20.rSp,
                      ),
                ),
                subtitle: Text(
                  Get.find<AuthController>().shopifyUser?.email ?? '',
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
                onTap: () {
                  Get.to(const AddressListScreen());
                },
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
              verticalSpace(131),
              InkWell(
                onTap: () async {
                  await Get.find<AuthController>().logout();
                  Get.offAll(() => const WelcomeScreen());
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.rh),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout_rounded,
                        size: 24.rSp,
                        color: Colors.red,
                      ),
                      horizontalSpace(16),
                      Expanded(
                        child: Text(
                          'Logout',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: 16.rSp,
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

