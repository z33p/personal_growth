import 'package:sqflite/sqflite.dart';

import 'Entity.dart';

class Company extends Entity {
  int companyId;

  final String name;

  Company({
    this.companyId
    , this.name
    , createdAt
    , updatedAt
  })
    : super(createdAt, updatedAt);

  Company.make({this.name}) : super.make();

  static const tableName = "companies";

  static const idColumn = "company_id";
  static const nameColumn = "name";

  static Future<void> createTable(Database db) async {
    return await db.execute("""
      CREATE TABLE $tableName(
        $idColumn INTEGER PRIMARY KEY
        , $nameColumn TEXT
        ${Entity.createEntityColumnsSql}
      )
    """);
  }

  static Company fromMap(Map<String, dynamic> companyMap) {
    var entity = Entity.fromMap(companyMap);

    var company = Company(
      companyId: companyMap[idColumn]
      , name: companyMap[nameColumn]
      , createdAt: entity.createdAt
      , updatedAt: entity.updatedAt
    );

    return company;
  }

  static List<Company> fromMapList(List<Map<String, dynamic>> companiesMap) {
    var companies = companiesMap.map((c) => fromMap(c)).toList();

    return companies;
  }

  @override
  Map<String, dynamic> toMap() {
    var companyMap = super.toMap();

    companyMap[nameColumn] = this.name;

    return companyMap;
  }
}
