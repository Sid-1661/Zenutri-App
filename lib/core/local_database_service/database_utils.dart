/// table information for "carts"
class CartsTableUtils {
  static String tableName = 'carts';
  static String columnId = 'id';
  static String columnTimeStamp = 'timestamp';
  static String columnTitle = 'title';
  static String columnPrice = 'price';
  static String columnImage = 'image';
  static String columnProductId = 'productId';

  static get tableCreationQuery => "CREATE TABLE $tableName ("
      "$columnId INTEGER PRIMARY KEY,"
      "$columnTimeStamp DATE DEFAULT (datetime('now','localtime')),"
      "$columnPrice DOUBLE NOT NULL,"
      "$columnImage TEXT NOT NULL,"
      "$columnProductId TEXT NOT NULL,"
      "$columnTitle TEXT NOT NULL)";
}

class FavouritesTableUtils {
  static String tableName = 'favourites';
  static String columnId = 'id';
  static String columnTimeStamp = 'timestamp';
  static String columnTitle = 'title';
  static String columnPrice = 'price';
  static String columnImage = 'image';
  static String columnProductId = 'productId';

  static get tableCreationQuery => "CREATE TABLE $tableName ("
      "$columnId INTEGER PRIMARY KEY,"
      "$columnTimeStamp DATE DEFAULT (datetime('now','localtime')),"
      "$columnPrice DOUBLE NOT NULL,"
      "$columnImage TEXT NOT NULL,"
      "$columnProductId TEXT NOT NULL,"
      "$columnTitle TEXT NOT NULL)";
}
