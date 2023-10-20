import 'package:get/get.dart';
import 'package:zenutri_app/features/carts/data/models/cart.dart';
import 'package:zenutri_app/features/carts/data/repositories/cart_repository.dart';

class CartController extends GetxController {
  bool _inProgress = false;
  List<Cart> _cartList = [];

  bool get inProgress => _inProgress;

  List<Cart> get cartList => _cartList;

  Future<void> getAllCarts() async {
    _inProgress = true;
    update();
    await Get.find<CartRepository>()
        .getAllCarts()
        .then((result) {
          _cartList = result;
    });
    _inProgress = false;
    update();
  }
}