import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_flutter/shopify_flutter.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/common/presentation/widgets/center_circular_progress_indicator.dart';
import 'package:zenutri_app/features/common/presentation/widgets/product_card.dart';
import 'package:zenutri_app/features/dashboard/presentation/controllers/dashboard_bottom_nav_controller.dart';
import 'package:zenutri_app/features/favourite/presentation/state_holders/favourite_controller.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<FavouriteController>().getAllFavourites();
    });
    super.initState();
  }

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
          title: const Text('Favourite'),
          actions: [
            // TextButton(
            //     onPressed: () {},
            //     child: Row(
            //       children: [
            //         const Icon(
            //           Icons.add,
            //           color: AppColors.primaryColor,
            //         ),
            //         horizontalSpace(8),
            //         Text(
            //           'Add',
            //           style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            //               color: AppColors.primaryColor,
            //               fontWeight: FontWeight.w600,
            //               fontSize: 16.rSp),
            //         ),
            //       ],
            //     ))
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.rSp),
            child: Container(
              color: AppColors.antiFlashWhite,
              height: 1.rSp,
            ),
          ),
        ),
        body: GetBuilder<FavouriteController>(
          builder: (controller) {
            if (controller.inProgress) {
              return const CenterCircularProgressLoader();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.rSp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(8),
                    Text(
                      '${controller.favouriteProductList.length} Items',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 22.rSp
                      ),
                    ),
                    verticalSpace(16),
                    productGridView(controller.favouriteProductList),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  GridView productGridView(List<Product> favouriteList) {
    return GridView.builder(
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: favouriteList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75.rSp,
          crossAxisSpacing: 8.rSp,
          mainAxisSpacing: 8.rSp),
      itemBuilder: (context, index) {
        return ProductCard(product: favouriteList[index]);
      },
    );
  }
}
