import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressCreateUpdateController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var isLoading = false.obs;

  var firstNameController = TextEditingController(text: '');
  var lastNameController = TextEditingController(text: '');
  var address1Controller = TextEditingController(text: '');
  var address2Controller = TextEditingController(text: '');
  var countryController = TextEditingController(text: '');
  var stateController = TextEditingController(text: '');
  var cityController = TextEditingController(text: '');

  @override
  void onInit() async {
    super.onInit();
  }

  _showProgressBar() {
    isLoading.value = true;
    update();
  }

  _hideProgressBar() {
    isLoading.value = false;
    update();
  }

}