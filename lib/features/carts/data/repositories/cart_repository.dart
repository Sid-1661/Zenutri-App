import 'package:sqflite/sqflite.dart';
import 'package:zenutri_app/core/local_database_service/database_provider.dart';
import 'package:zenutri_app/core/local_database_service/database_utils.dart';

import '../models/cart.dart';

class CartRepository {
  Future<bool> addToCart(Cart cart) async {
    final Database database = await DBProvider.db.database;
    int id = await database.insert(CartsTableUtils.tableName, cart.toMap());
    return id != 0 ;
  }

  Future<bool> removeFromCart(int id) async {
    final Database database = await DBProvider.db.database;
    int result = await database.delete(CartsTableUtils.tableName, where: '${CartsTableUtils.columnId} = ?', whereArgs: [id]);
    return result != 0;
  }

  Future<List<Cart>> getAllCarts() async {
    List<Cart> cartList = [];
    final Database database = await DBProvider.db.database;
    final result = await database.query(CartsTableUtils.tableName);
    for (var r in result) {
      cartList.add(Cart.fromJson(r));
    }
    return cartList;
  }
}