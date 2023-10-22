import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/features/carts/presentation/state_holders/cart_controller.dart';
import 'package:zenutri_app/features/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/checkout/presentation/ui/screens/check_out_screen.dart';
import 'package:zenutri_app/features/common/presentation/widgets/center_circular_progress_indicator.dart';
import 'package:zenutri_app/features/common/presentation/widgets/product_card.dart';
import 'package:zenutri_app/features/dashboard/presentation/controllers/dashboard_bottom_nav_controller.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<DashboardBottomNavController>().back();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Cart',
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.rw,
            vertical: 16.rh,
          ),
          child: Column(
            children: [
              Expanded(
                child: GetBuilder<CartController>(
                  builder: (controller) {
                    if (controller.inProgress) {
                      return const CenterCircularProgressLoader();
                    }
                    return ListView.separated(
                      itemCount: controller.cartProductList.length,
                      itemBuilder: (context, index) {
                        return ProductCard(product: controller.cartProductList[index]);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return verticalSpace(24);
                      },
                    );
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: SizedBox(
                  width: 100.w,
                  child: ElevatedButton(
                    child: const Text('Process to Checkout - \$285.3 AUD'),
                    onPressed: () {
                      Get.to(const CheckOutScreen());
                    },
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