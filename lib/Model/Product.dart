import 'package:sqflite/sqflite.dart';

import 'Company.dart';
import 'Entity.dart';

class Product extends Entity {
  int productId;

  final String name;
  final int price;

  final int companyId;
  final Company company;

  Product(
    this.productId
    , this.name
    , this.price
    , this.companyId
    , this.company
  );

  Product.make(
    this.name
    , this.price
    , this.companyId
    , this.company
  );

  static String tableName = "products";

  static String idColumn = "product_id";
  static String nameColumn = "name";
  static String priceColumn = "price";

  static String companyIdColumn = "company_id";

  static Future<void> createTable(Database db) async {
    return  await db.execute("""
      CREATE TABLE $tableName(
        $idColumn INTEGER PRIMARY KEY
        , $nameColumn TEXT
        , $priceColumn INTEGER
        , ${Product.companyIdColumn} INTEGER
        , FOREIGN KEY (${Product.companyIdColumn}) REFERENCES ${Company.tableName} (${Company.idColumn}) ON DELETE NO ACTION ON UPDATE NO ACTION
      )
    """);
  }
}