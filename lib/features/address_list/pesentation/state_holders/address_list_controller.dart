import 'package:get/get.dart';
import 'package:shopify_flutter/models/models.dart';
import 'package:shopify_flutter/models/src/shopify_user/address/address.dart';

import '../../../auth/presentation/state_holders/auth_controller.dart';

class AddressListController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var isLoading = false.obs;

  var addressList = <Address>[].obs;

  var shopifyUser = ShopifyUser().obs;

  ShopifyUser? user = Get.find<AuthController>().shopifyUser;

  @override
  void onInit() async {
    super.onInit();
    fetchCustomerAddress();
  }

  fetchCustomerAddress() async {
    shopifyUser.value = Get.find<AuthController>().shopifyUser!;
    // addressList.value = user!.address!.addressList;
    update();
  }

  refreshAddressList() async {
    await Get.find<AuthController>().refreshUserInfo();
    shopifyUser.value = Get.find<AuthController>().shopifyUser!;
    update();
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