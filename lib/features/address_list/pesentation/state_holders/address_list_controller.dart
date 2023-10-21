import 'package:get/get.dart';

class AddressListController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var isLoading = false.obs;


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