import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/features/address_list/data/repositories/address_list_repository.dart';
import '../../../../address_list/pesentation/ui/widgets/app_bar.dart';
import '../../../../auth/presentation/state_holders/auth_controller.dart';
import '../../../../common/presentation/utils/app_colors.dart';
import '../../state_holders/address_create_update_controller.dart';
import '../widgets/custom_text_field.dart';

class AddressCreateUpdateScreen extends StatelessWidget {
  const AddressCreateUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressCreateUpdateController>(builder: (addressCreateUpdateController) {
      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: CommonAppBar(
          title: 'Address Create',
          height: kToolbarHeight,
          elevation: 0,
          icon: Icons.arrow_back,
          finishScreen: true,
          isTitleCenter: true,
          context: context,
        ),
        bottomNavigationBar: SizedBox(
          child: ElevatedButton(
            onPressed: () async {
              addressCreateUpdateController.customerAddressCreate();
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                ),
              ),
            ),
            child: const Text('Add Address'),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addressInputItem(title: "First Name", hint: "The first name of the customer.", textEditingController: addressCreateUpdateController.firstNameController),
                const SizedBox(
                  height: 12,
                ),
                addressInputItem(title: "Last Name", hint: "The last name of the customer.", textEditingController: addressCreateUpdateController.lastNameController),
                const SizedBox(
                  height: 12,
                ),
                addressInputItem(
                    minLines: 2,
                    title: "Address 1",
                    hint: "The first line of the address. Typically the street address or PO Box number.",
                    textEditingController: addressCreateUpdateController.address1Controller),
                const SizedBox(
                  height: 12,
                ),
                addressInputItem(
                    minLines: 2,
                    title: "Address 2",
                    hint: "The second line of the address. Typically the number of the apartment, suite, or unit.",
                    textEditingController: addressCreateUpdateController.address2Controller),
                const SizedBox(
                  height: 12,
                ),

                addressInputItem(title: "Phone", hint: "For example, +16135551111.", textEditingController: addressCreateUpdateController.phoneController),
                const SizedBox(
                  height: 12,
                ),

                addressInputItem(title: "Country", hint: "Enter Your Country", textEditingController: addressCreateUpdateController.countryController),
                const SizedBox(
                  height: 12,
                ),
                addressInputItem(
                    title: "City", hint: "The name of the city, district, village, or town.", textEditingController: addressCreateUpdateController.cityController),
                const SizedBox(
                  height: 12,
                ),
                addressInputItem(title: "Zip Code", hint: "The zip or postal code of the address.", textEditingController: addressCreateUpdateController.zipController),
                const SizedBox(
                  height: 12,
                ),
                addressInputItem(title: "Province", hint: "The region of the address.", textEditingController: addressCreateUpdateController.provinceController),
                const SizedBox(
                  height: 12,
                ),
                addressInputItem(title: "Company", hint: "Enter Your Company", textEditingController: addressCreateUpdateController.companyController),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget addressInputItem({required String title, required String hint, required TextEditingController textEditingController, int? minLines,}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormField(
          textEditingController: textEditingController,
          hint: hint,
          minLines: minLines ?? 1,
        ),
      ],
    );
  }
}
