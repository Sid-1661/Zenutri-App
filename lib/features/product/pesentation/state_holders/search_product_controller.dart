import 'package:get/get.dart';
import 'package:shopify_flutter/models/models.dart';
import 'package:zenutri_app/application/app_config.dart';
import 'package:zenutri_app/features/common/domain/entities/failure.dart';
import 'package:zenutri_app/features/product/data/repositories/product_repository.dart';

class SearchProductController extends GetxController {
  bool _inProgress = false;
  late Failure _failure;
  List<Product> _productList = [];

  bool get inProgress => _inProgress;

  Failure get failure => _failure;

  List<Product> get productList => _productList;

  Future<void> searchProducts(String query) async {
    _inProgress = true;
    update();
    final response = await Get.find<ProductRepository>()
        .searchCollectionProducts(AppConfig.bundleCollectionId, query);
    response.fold((l) => _failure = l, (r) => _productList = r);
    _inProgress = false;
    update();
  }
}