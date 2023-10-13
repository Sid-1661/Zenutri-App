import 'package:get/get.dart';
import 'package:zenutri_app/features/auth/data/repositories/auth_repository.dart';
import 'package:zenutri_app/features/auth/domain/entities/failure.dart';

class SignInController extends GetxController {
  bool _inProgress = false;
  late Failure _failure;

  bool get inProgress => _inProgress;

  Failure get failure => _failure;

  Future<bool> signIn(String email, String password) async {
    late bool status;
    _inProgress = true;
    update();
    await Get.find<AuthRepository>()
        .login(email, password)
        .then((result) {
      result.fold((l) {
        _failure = Failure(message: 'Please check your email or password');
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
