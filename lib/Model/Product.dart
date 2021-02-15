import 'package:personal_grouth/Model/Entity.dart';
import 'package:sqflite/sqflite.dart';

class Product extends Entity {
  int productId;

  final String name;
  final int price;

  Product({
    this.productId
    , this.name
    , this.price
    , createdAt
    , updatedAt
  })
    : super(createdAt, updatedAt);

  Product.make({this.name, this.price}) : super.make();

  static String tableName = "products";

  static String idColumn = "product_id";
  static String nameColumn = "name";
  static String priceColumn = "price";

  static Future<void> createTable(Database db) async {
    return await db.execute("""
      CREATE TABLE $tableName(
        $idColumn INTEGER PRIMARY KEY
        , $nameColumn TEXT
        , $priceColumn INTEGER
        ${Entity.createEntityColumnsSql}
      )
    """);
  }

  static Product fromMap(Map<String, dynamic> productMap) {
    var entity = Entity.fromMap(productMap);

    var product = Product(
      productId: productMap[idColumn]
      , name: productMap[nameColumn]
      , price: productMap[priceColumn]
      , createdAt: entity.createdAt
      , updatedAt: entity.updatedAt
    );

    return product;
  }

  static List<Product> fromMapList(List<Map<String, dynamic>> productsMap) {
    var products = productsMap.map((p) => fromMap(p)).toList();

    return products;
  }

  Map<String, dynamic> toMap() {
    var productMap = super.toMap();

    productMap[nameColumn] = this.name;
    productMap[priceColumn] = this.price;

    return productMap;
  }
}
