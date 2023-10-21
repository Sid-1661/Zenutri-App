import 'package:sqflite/sqflite.dart';
import 'package:zenutri_app/core/local_database_service/database_provider.dart';
import 'package:zenutri_app/core/local_database_service/database_utils.dart';

import '../models/favourite.dart';

class FavouriteRepository {
  Future<bool> addToFavourites(Favourite cart) async {
    final Database database = await DBProvider.db.database;
    int id = await database.insert(CartsTableUtils.tableName, cart.toMap());
    return id != 0 ;
  }

  Future<bool> removeFromFavourite(String id) async {
    final Database database = await DBProvider.db.database;
    int result = await database.delete(CartsTableUtils.tableName, where: '${CartsTableUtils.columnProductId} = ?', whereArgs: [id]);
    return result != 0;
  }

  Future<bool> checkIfFavourite(String productId) async {
    final Database database = await DBProvider.db.database;
    final result = await database.query(CartsTableUtils.tableName, where: '${CartsTableUtils.columnProductId} = ?', whereArgs: [productId]);
    return result.isNotEmpty;
  }

  Future<List<Favourite>> getAllFavourite() async {
    List<Favourite> cartList = [];
    final Database database = await DBProvider.db.database;
    final result = await database.query(CartsTableUtils.tableName);
    for (var r in result) {
      cartList.add(Favourite.fromJson(r));
    }
    return cartList;
  }
}