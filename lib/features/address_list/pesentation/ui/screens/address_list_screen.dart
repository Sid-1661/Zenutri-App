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
          child: ElevatedButton(
            onPressed: () {
              Get.to(const AddressCreateUpdateScreen());
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  side: BorderSide(
                    color: AppColors.primaryColor,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            child: const Text('Add Address'),
          ),
        ),
        body: ListView.separated(
          itemCount: 5,
          shrinkWrap: true,
          primary: false,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            return ShippingAddressCard(isAddressListScreen: true,);
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
