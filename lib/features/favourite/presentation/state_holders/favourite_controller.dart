import 'package:get/get.dart';
import 'package:zenutri_app/features/favourite/data/models/favourite.dart';
import 'package:zenutri_app/features/favourite/data/repositories/favourite_repository.dart';

class FavouriteController extends GetxController {
  bool _inProgress = false;
  List<Favourite> _favouriteList = [];

  bool get inProgress => _inProgress;

  List<Favourite> get favouriteList => _favouriteList;

  Future<void> getAllFavourites() async {
    _inProgress = true;
    update();
    await Get.find<FavouriteRepository>()
        .getAllFavourite()
        .then((result) {
          _favouriteList = result;
    });
    _inProgress = false;
    update();
  }
}