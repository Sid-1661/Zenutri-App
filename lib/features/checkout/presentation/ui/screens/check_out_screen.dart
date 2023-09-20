import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/common/presentation/utils/image_assets.dart';
import 'package:zenutri_app/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/checkout/presentation/ui/widgets/delivery_method_card.dart';
import 'package:zenutri_app/features/checkout/presentation/ui/widgets/shipping_address_card.dart';
import 'package:zenutri_app/features/orders/presentation/ui/screens/orders_screen.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shipping address',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 20.rSp, fontWeight: FontWeight.w600),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Add new',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            const ShippingAddressCard(),
            verticalSpace(34),
            Text(
              'Delivery method',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 20.rSp, fontWeight: FontWeight.w600),
            ),
            verticalSpace(16),
            Row(
              children: [
                const DeliveryMethodCard(
                  image: ImageAssets.dhlSvg,
                  days: '2-3',
                  selected: false,
                ),
                horizontalSpace(12),
                const DeliveryMethodCard(
                  image: ImageAssets.fedexExpressSvg,
                  days: '2-3',
                  selected: true,
                ),
              ],
            ),
            verticalSpace(39),
            SizedBox(
              width: 100.w,
              child: ElevatedButton(
                child: const Text('Place the order'),
                onPressed: () {
                  Get.to(const OrdersScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
