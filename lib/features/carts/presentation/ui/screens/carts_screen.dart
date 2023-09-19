import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/carts/presentation/ui/widgets/cart_item_list_tile.dart';
import 'package:zenutri_app/features/checkout/presentation/ui/screens/check_out_screen.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: ListView.separated(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const CartItemListTile();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return verticalSpace(24);
                },
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
    );
  }
}