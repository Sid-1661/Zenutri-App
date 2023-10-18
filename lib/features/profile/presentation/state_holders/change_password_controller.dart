import 'package:get/get.dart';
import 'package:zenutri_app/features/common/domain/entities/failure.dart';
import 'package:zenutri_app/features/profile/data/repositories/profile_repository.dart';

class ChangePasswordController extends GetxController {
  bool _inProgress = false;
  late Failure _failure;

  bool get inProgress => _inProgress;

  Failure get failure => _failure;

  Future<bool> changePassword(String password, String accessToken, String email) async {
    late bool status;
    _inProgress = true;
    update();
    await Get.find<ProfileRepository>()
        .changePassword(password, accessToken, email)
        .then((result) {
      result.fold((l) {
        _failure = Failure(message: 'Something went wrong! Try again.');
        status = false;
      }, (r) {
        status = true;
      });
    });
    _inProgress = false;
    update();
    return status;
  }
}
