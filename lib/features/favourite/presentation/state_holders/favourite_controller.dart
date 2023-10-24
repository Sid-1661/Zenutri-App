import 'package:get/get.dart';
import 'package:shopify_flutter/models/models.dart';
import 'package:zenutri_app/features/favourite/data/models/favourite.dart';
import 'package:zenutri_app/features/favourite/data/repositories/favourite_repository.dart';
import 'package:zenutri_app/features/product/data/repositories/product_repository.dart';

class FavouriteController extends GetxController {
  bool _inProgress = false;
  List<Favourite> _favouriteList = [];
  List<Product> _favouriteProductList = [];

  bool get inProgress => _inProgress;

  List<Favourite> get favouriteList => _favouriteList;

  List<Product> get favouriteProductList => _favouriteProductList;

  Future<void> getAllFavourites() async {
    _inProgress = true;
    update();
    await Get.find<FavouriteRepository>()
        .getAllFavourite()
        .then((result) {
          _favouriteList = result;
    });
    List<String> ids = _favouriteList.map((e) => e.productId).toList();
    await Get.find<ProductRepository>().getProductListByIds(ids).then((value) {
      value.fold((l) {}, (r) => _favouriteProductList = r);
    });
    _inProgress = false;
    update();
  }

  Future<bool> addToFavourite(Favourite favourite) {
    return Get.find<FavouriteRepository>().addToFavourites(favourite);
  }

  Future<bool> removeFromFavourite(String productId) {
    _favouriteProductList = _favouriteProductList.where((e) => e.id != productId).toList();
    update();
    return Get.find<FavouriteRepository>().removeFromFavourite(productId);
  }

  Future<bool> checkIfFavourite(String productId) {
    return Get.find<FavouriteRepository>().checkIfFavourite(productId);
  }
}