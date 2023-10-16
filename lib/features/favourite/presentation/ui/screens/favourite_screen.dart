import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/features/common/presentation/widgets/product_card.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/dashboard/presentation/controllers/dashboard_bottom_nav_controller.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

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
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.add,
                      color: AppColors.primaryColor,
                    ),
                    horizontalSpace(8),
                    Text(
                      'Add',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.rSp),
                    ),
                  ],
                ))
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.rSp),
            child: Container(
              color: AppColors.antiFlashWhite,
              height: 1.rSp,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.rSp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(8),
                Text(
                  '3 Items',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 22.rSp
                  ),
                ),
                verticalSpace(16),
                productGridView,
              ],
            ),
          ),
        ),
      ),
    );
  }

  GridView get productGridView {
    return GridView.builder(
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75.rSp,
          crossAxisSpacing: 8.rSp,
          mainAxisSpacing: 8.rSp),
      itemBuilder: (context, index) {
        // return const ProductCard();
      },
    );
  }
}
