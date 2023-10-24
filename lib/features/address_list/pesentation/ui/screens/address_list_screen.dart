import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/address_create_update/pesentation/state_holders/address_create_update_controller.dart';
import 'package:zenutri_app/features/address_create_update/pesentation/ui/screens/address_create_update_screen.dart';

import '../../../../auth/presentation/state_holders/auth_controller.dart';
import '../../../../checkout/presentation/ui/widgets/shipping_address_card.dart';
import '../../../../common/presentation/utils/app_colors.dart';
import '../../../../common/presentation/utils/spacing.dart';
import '../../../../common/presentation/widgets/center_circular_progress_indicator.dart';
import '../../../../common/presentation/widgets/no_data_found_widget.dart';
import '../widgets/app_bar.dart';

class AddressListScreen extends StatelessWidget {
  const AddressListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
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
              Get.to(AddressCreateUpdateScreen(
                addressForEdit: null,
                isForUpdateAddress: false,
              ));
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
        body: Stack(
          children: [
            authController.shopifyUser!.address!.addressList.isNotEmpty
                ? ListView.separated(
                    itemCount: authController.shopifyUser!.address!.addressList.length,
                    // itemCount: addressListController.shopifyUser.value.address!.addressList.length,
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      return ShippingAddressCard(
                        isAddressListScreen: true,
                        address: authController.shopifyUser!.address!.addressList[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 8,
                        color: AppColors.white,
                      );
                    },
                  )
                : NoDataFoundWidget(
                    title: "You have no address",
                  ),
            Visibility(
                visible: Get.find<AddressCreateUpdateController>().isLoading.value,
                child: Container(
                    color: AppColors.aluminium.withOpacity(.2),
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    child: const SizedBox(height: 40, width: 40, child: CenterCircularProgressLoader())))
          ],
        ),
      );
    });
  }
}
