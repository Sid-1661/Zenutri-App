import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../address_list/pesentation/ui/widgets/app_bar.dart';
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "First Name",
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                textEditingController: addressCreateUpdateController.firstNameController,
                hint: "First Name",
              ),
              const SizedBox(
                height: 12,
              ),

              const Text(
                "Last Name",
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                textEditingController: addressCreateUpdateController.lastNameController,
                hint: "Last Name",
              ),
              const SizedBox(
                height: 12,
              ),

              const Text(
                "Address 1",
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                textEditingController: addressCreateUpdateController.address1Controller,
                hint: "Address 1",
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Address 2",
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                textEditingController: addressCreateUpdateController.address2Controller,
                hint: "Address 2",
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Country",
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                textEditingController: addressCreateUpdateController.countryController,
                hint: "Country",
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "City",
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                textEditingController: addressCreateUpdateController.cityController,
                hint: "City",
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "City",
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                textEditingController: addressCreateUpdateController.cityController,
                hint: "City",
              ),
            ],
          ),
        ),
      );
    });
  }
}
