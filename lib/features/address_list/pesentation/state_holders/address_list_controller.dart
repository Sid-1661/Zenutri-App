import 'package:get/get.dart';
import 'package:shopify_flutter/models/models.dart';
import 'package:shopify_flutter/models/src/shopify_user/address/address.dart';

import '../../../auth/presentation/state_holders/auth_controller.dart';

class AddressListController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var isLoading = false.obs;

  var addressList = <Address>[].obs;


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