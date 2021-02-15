import 'package:personal_grouth/Model/Company.dart';
import 'package:personal_grouth/Model/Entity.dart';
import 'package:personal_grouth/Model/Product.dart';
import 'package:sqflite/sqflite.dart';


class CompanyProduct extends Entity {
  int companyProductId;
  int companyId;
  int productId;

  CompanyProduct({
    this.companyProductId
    , companyId
    , productId
    , createdAt
    , updatedAt
  })
    : super(createdAt, updatedAt);

  static const tableName = "company_product";
  static const idColumn = "company_product_id";

  static Future<void> createTable(Database db) async {
    return await db.execute("""
      CREATE TABLE $tableName(
        $idColumn INTEGER PRIMARY KEY
        , ${Company.idColumn} INTEGER
        , ${Product.idColumn} INTEGER
        ${Entity.createEntityColumnsSql}
        , FOREIGN KEY (${Company.idColumn}) REFERENCES ${Company.tableName} (${Company.idColumn}) ON DELETE NO ACTION ON UPDATE NO ACTION
        , FOREIGN KEY (${Product.idColumn}) REFERENCES ${Product.tableName} (${Product.idColumn}) ON DELETE NO ACTION ON UPDATE NO ACTION
      )
    """);
  }
}
