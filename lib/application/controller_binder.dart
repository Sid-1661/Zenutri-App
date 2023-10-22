import 'package:get/get.dart';
import 'package:zenutri_app/features/auth/data/repositories/auth_repository.dart';
import 'package:zenutri_app/features/auth/presentation/state_holders/auth_controller.dart';
import 'package:zenutri_app/features/auth/presentation/state_holders/forgot_password_controller.dart';
import 'package:zenutri_app/features/auth/presentation/state_holders/sign_in_controller.dart';
import 'package:zenutri_app/features/auth/presentation/state_holders/sign_up_controller.dart';
import 'package:zenutri_app/features/carts/data/repositories/cart_repository.dart';
import 'package:zenutri_app/features/carts/presentation/state_holders/cart_controller.dart';
import 'package:zenutri_app/features/dashboard/presentation/controllers/dashboard_bottom_nav_controller.dart';
import 'package:zenutri_app/features/dashboard/presentation/controllers/home_products_controller.dart';
import 'package:zenutri_app/features/favourite/data/repositories/favourite_repository.dart';
import 'package:zenutri_app/features/favourite/presentation/state_holders/favourite_controller.dart';
import 'package:zenutri_app/features/product/data/repositories/product_repository.dart';
import 'package:zenutri_app/features/profile/data/repositories/profile_repository.dart';
import 'package:zenutri_app/features/profile/presentation/state_holders/change_password_controller.dart';
import 'package:zenutri_app/features/profile/presentation/state_holders/update_profile_controller.dart';

import '../features/address_create_update/pesentation/state_holders/address_create_update_controller.dart';
import '../features/address_list/pesentation/state_holders/address_list_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardBottomNavController());
    Get.put(AuthRepository());
    Get.put(SignUpController());
    Get.put(SignInController());
    Get.put(AuthController());
    Get.put(ForgotPasswordController());
    Get.put(ProductRepository());
    Get.put(HomeProductController());
    Get.put(ProfileRepository());
    Get.put(UpdateProfileController());
    Get.put(ChangePasswordController());
    Get.put(CartRepository());
    Get.put(CartController());
    Get.put(FavouriteRepository());
    Get.put(FavouriteController());
    Get.put(AddressListController());
    Get.put(AddressCreateUpdateController());
  }
}