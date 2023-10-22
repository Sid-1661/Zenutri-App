import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/features/address_list/data/repositories/address_list_repository.dart';

import '../../../auth/presentation/state_holders/auth_controller.dart';
import '../../../common/domain/entities/failure.dart';

class AddressCreateUpdateController extends GetxController with GetSingleTickerProviderStateMixin {
  var isLoading = false.obs;
  late Failure _failure;

  var firstNameController = TextEditingController(text: 'ImtiaZ');
  var lastNameController = TextEditingController(text: 'aMIN');
  var address1Controller = TextEditingController(text: 'Malibag');
  var address2Controller = TextEditingController(text: 'Dhaka');
  var countryController = TextEditingController(text: 'Bangladesh');
  var stateController = TextEditingController(text: 'Dhaka');
  var cityController = TextEditingController(text: 'Mouchak');
  var companyController = TextEditingController(text: 'Tikweb');
  var phoneController = TextEditingController(text: '+8801677006082');
  var zipController = TextEditingController(text: '1215');
  var provinceController = TextEditingController(text: 'Noakhali');

  Failure get failure => _failure;

  @override
  void onInit() async {
    super.onInit();
  }

  resetAllTextEditingController() {
    firstNameController.clear();
    lastNameController.clear();
    address1Controller.clear();
    address2Controller.clear();
    countryController.clear();
    stateController.clear();
    cityController.clear();
    companyController.clear();
    phoneController.clear();
    zipController.clear();
    provinceController.clear();
  }

  _showProgressBar() {
    isLoading.value = true;
    update();
  }

  _hideProgressBar() {
    isLoading.value = false;
    update();
  }

  Future<void> customerAddressCreate() async {
    _showProgressBar();
    final customerAccessToken = await Get.find<AuthController>().shopifyAuth.currentCustomerAccessToken ?? '';

    log("customerAccessToken $customerAccessToken");

    Get.find<AddressRepository>()
        .addressCreate(
            address1: address1Controller.value.text,
            address2: address2Controller.value.text,
            company: companyController.value.text,
            city: cityController.value.text,
            country: countryController.value.text,
            firstName: firstNameController.value.text,
            lastName: lastNameController.value.text,
            phone: phoneController.value.text,
            province: provinceController.value.text,
            zip: zipController.value.text,
            customerAccessToken: customerAccessToken)
        .then((result) {
      result.fold((l) {
        _failure = Failure(message: 'Failed');
      }, (r) {
        log("address $r");
        resetAllTextEditingController();
      });
    });
    _hideProgressBar();
  }

  Future<void> customerAddressUpdate(String addressID) async {
    _showProgressBar();
    final customerAccessToken = await Get.find<AuthController>().shopifyAuth.currentCustomerAccessToken ?? '';

    log("customerAccessToken $customerAccessToken");

    Get.find<AddressRepository>()
        .addressUpdate(
            addressID: addressID,
            address1: address1Controller.value.text,
            address2: address2Controller.value.text,
            company: companyController.value.text,
            city: cityController.value.text,
            country: countryController.value.text,
            firstName: firstNameController.value.text,
            lastName: lastNameController.value.text,
            phone: phoneController.value.text,
            province: provinceController.value.text,
            zip: zipController.value.text,
            customerAccessToken: customerAccessToken)
        .then((result) {
      result.fold((l) {
        _failure = Failure(message: 'Failed');
      }, (r) {
        log("address $r");
        resetAllTextEditingController();
      });
    });
    _hideProgressBar();
  }

  Future<void> customerAddressDelete({required String addressID}) async {
    _showProgressBar();
    final customerAccessToken = await Get.find<AuthController>().shopifyAuth.currentCustomerAccessToken ?? '';

    log("customerAccessToken $customerAccessToken");

    Get.find<AddressRepository>().addressDelete(addressID: addressID, customerAccessToken: customerAccessToken).then((result) {
      result.fold((l) {
        _failure = Failure(message: 'Failed');
      }, (r) {
        log("address delete success $r");
      });
    });
    _hideProgressBar();
  }
}
