import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/address_create_update/pesentation/ui/screens/address_create_update_screen.dart';

import '../../../../checkout/presentation/ui/widgets/shipping_address_card.dart';
import '../../../../common/presentation/utils/app_colors.dart';
import '../../../../common/presentation/utils/spacing.dart';
import '../../state_holders/address_list_controller.dart';
import '../widgets/app_bar.dart';

class AddressListScreen extends StatelessWidget {
  const AddressListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressListController>(builder: (addressListController) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        title: 'Address List',
        height: kToolbarHeight,
        elevation: 0,
        icon: Icons.arrow_back,
        finishScreen: true,
        isTitleCenter: true,
        context: context,
      ),
      bottomNavigationBar: SizedBox(
        width: 100.w,
        child: ElevatedButton(
          onPressed: () {
            Get.to(const AddressCreateUpdateScreen());
          },
          child: const Text('Login'),
        ),
      ),
      body: ListView.separated(
        itemCount: 5,
        shrinkWrap: true,
        primary: false,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return const ShippingAddressCard();
        },
        separatorBuilder: (context, index) {
          return Container(
            height: 8,
            color: AppColors.white,
          );
        },
      ),
    );
    });
  }
}
