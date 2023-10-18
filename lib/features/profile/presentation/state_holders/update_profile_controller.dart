import 'dart:developer';

import 'package:get/get.dart';
import 'package:zenutri_app/features/auth/presentation/state_holders/auth_controller.dart';
import 'package:zenutri_app/features/common/domain/entities/failure.dart';
import 'package:zenutri_app/features/profile/data/repositories/profile_repository.dart';

class UpdateProfileController extends GetxController {
  bool _inProgress = false;
  late Failure _failure;

  bool get inProgress => _inProgress;

  Failure get failure => _failure;

  Future<bool> updateProfile(String firstName, String lastName,
      String phoneNumber, String accessToken, String email) async {
    late bool status;
    _inProgress = true;
    update();
    await Get.find<ProfileRepository>()
        .updateProfile(firstName, lastName, phoneNumber, accessToken, email)
        .then((result) {
      result.fold((l) {
        log(l.message);
        _failure = l;
        log(_failure.message);
        status = false;
      }, (r) {
        Get.find<AuthController>().refreshUserInfo();
        status = true;
      });
    });
    _inProgress = false;
    update();
    return status;
  }
}
