import 'package:get/get.dart';
import 'package:shopify_flutter/models/models.dart';
import 'package:zenutri_app/features/carts/data/models/cart.dart';
import 'package:zenutri_app/features/carts/data/repositories/cart_repository.dart';
import 'package:zenutri_app/features/product/data/repositories/product_repository.dart';

class CartController extends GetxController {
  bool _inProgress = false;
  List<Cart> _cartList = [];
  List<Product> _cartProductList = [];

  bool get inProgress => _inProgress;

  List<Cart> get cartList => _cartList;

  List<Product> get cartProductList => _cartProductList;

  Future<void> getAllCarts() async {
    _inProgress = true;
    update();
    await Get.find<CartRepository>()
        .getAllCarts()
        .then((result) {
          _cartList = result;
    });
    List<String> ids = _cartList.map((e) => e.productId).toList();
    await Get.find<ProductRepository>().getProductListByIds(ids).then((value) {
      value.fold((l) {}, (r) => _cartProductList = r);
    });
    _inProgress = false;
    update();
  }
}