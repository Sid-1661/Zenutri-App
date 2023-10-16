import 'package:get/get.dart';
import 'package:shopify_flutter/models/src/product/product.dart';
import 'package:zenutri_app/application/app_config.dart';
import 'package:zenutri_app/features/common/domain/entities/failure.dart';
import 'package:zenutri_app/features/product/data/repositories/product_repository.dart';

class HomeProductController extends GetxController {
  bool _inProgress = false;
  late Failure _failure;
  List<Product> _productList = [];

  bool get inProgress => _inProgress;

  Failure get failure => _failure;

  List<Product> get productList => _productList;

  Future<bool> getBundleProducts() async {
    late bool status;
    _inProgress = true;
    update();
    await Get.find<ProductRepository>()
        .getCollectionProducts(AppConfig.bundleCollectionId)
        .then((result) {
      result.fold((l) {
        _failure = Failure(message: 'Please check your email or password');
        status = false;
      }, (r) {
        _productList = r;
        status = true;
      });
    });
    _inProgress = false;
    update();
    return status;
  }
}
