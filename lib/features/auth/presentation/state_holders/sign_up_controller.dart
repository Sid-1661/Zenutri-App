import 'package:get/get.dart';
import 'package:zenutri_app/features/auth/data/repositories/auth_repository.dart';
import 'package:zenutri_app/features/auth/presentation/state_holders/auth_controller.dart';
import 'package:zenutri_app/features/common/domain/entities/failure.dart';

class SignUpController extends GetxController {
  bool _inProgress = false;
  late Failure _failure;

  bool get inProgress => _inProgress;

  Failure get failure => _failure;

  Future<bool> signUp(
      String firstName, String lastName, String email, String password, String phone) async {
    late bool status;
    _inProgress = true;
    update();
    await Get.find<AuthRepository>()
        .createCustomer(firstName, lastName, email, password, phone)
        .then((result) {
      result.fold((l) {
        _failure = l;
        status = false;
      }, (r) {
        Get.find<AuthController>().shopifyUser = r;
        status = true;
      });
    });
    _inProgress = false;
    update();
    return status;
  }
}
