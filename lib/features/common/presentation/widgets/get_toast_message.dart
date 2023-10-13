import 'package:get/get.dart';

void showGetSnackMessage(String title, String message) {
  Get.showSnackbar(
    GetSnackBar(
      title: title,
      message: message,
      duration: const Duration(seconds: 2),
    ),
  );
}