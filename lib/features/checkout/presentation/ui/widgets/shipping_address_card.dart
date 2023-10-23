import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_flutter/models/src/shopify_user/address/address.dart';
import 'package:zenutri_app/features/address_create_update/pesentation/state_holders/address_create_update_controller.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/common/presentation/utils/image_assets.dart';
import 'package:zenutri_app/features/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/features/common/presentation/widgets/svg_builder.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';

import '../../../../address_create_update/pesentation/ui/screens/address_create_update_screen.dart';

class ShippingAddressCard extends StatelessWidget {
  ShippingAddressCard({super.key, required this.isAddressListScreen, required this.address});

  bool isAddressListScreen;
  Address? address;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: AppColors.softWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.rSp)),
      child: Padding(
        padding: EdgeInsets.all(24.rSp),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  '${address!.name}',
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
                IconButton(
                  onPressed: () {
                    Get.find<AddressCreateUpdateController>().setAddressDetailsForEdit(address!);
                    Get.to(AddressCreateUpdateScreen(addressForEdit: address, isForUpdateAddress: true,));
                  },
                  icon: const SvgBuilder(
                    path: ImageAssets.editSvg,
                    color: AppColors.black,
                  ),
                ),
                isAddressListScreen
                    ? IconButton(
                        onPressed: () {
                          _showAlertDialog(context, address!.id);
                        },
                        icon: Icon(
                          Icons.delete_forever,
                          color: AppColors.red,
                        ),
                      )
                    : SizedBox.shrink()
              ],
            ),
            verticalSpace(18),
            Row(
              children: [
                SvgBuilder(
                  path: ImageAssets.callSvg,
                  color: AppColors.black,
                  height: 16.rSp,
                  width: 16.rSp,
                ),
                horizontalSpace(8),
                Expanded(
                  child: Text(
                    '${address!.phone}',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.shadowGray),
                  ),
                ),
              ],
            ),
            verticalSpace(12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgBuilder(
                  path: ImageAssets.locationSvg,
                  color: AppColors.black,
                  height: 16.rSp,
                  width: 16.rSp,
                ),
                horizontalSpace(8),
                Expanded(
                  child: Text(
                    '${address!.address1}\n${address!.address2}',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.shadowGray),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Future<void> _showAlertDialog(BuildContext context, String? id) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE
        title: Text("Address"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text("Are you sure want to delete this address?"),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'No',
              style: TextStyle(color: AppColors.red),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              'Yes',
              style: TextStyle(color: AppColors.primaryColor),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Get.find<AddressCreateUpdateController>().customerAddressDelete(addressID: id!);
            },
          ),
        ],
      );
    },
  );
}
