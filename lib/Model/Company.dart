import 'package:sqflite/sqflite.dart';

import 'Entity.dart';

class Company extends Entity {
  int companyId;

  final String name;

  Company(this.companyId, this.name);
  Company.make(this.name);

  static const tableName = "companies";

  static const idColumn = "company_id";
  static const nameColumn = "name";

  static Future<void> createTable(Database db) async {
    return await db.execute("""
      CREATE TABLE $tableName(
        $idColumn INTEGER PRIMARY KEY
        , $nameColumn TEXT
        , ${Entity.createColumnsSql}
      )
    """);
  }

  static Company fromMap(Map<String, dynamic> companyMap) {
    var company = Company(companyMap[idColumn], companyMap[nameColumn]);

    return company;
  }

  static List<Company> fromMapList(List<Map<String, dynamic>> companiesMap) {
    var companies = companiesMap.map((c) => fromMap(c)).toList();

    return companies;
  }

  Map<String, dynamic> toMap() {
    var companyMap = Map<String, dynamic>();

    companyMap[nameColumn] = this.name;

    return companyMap;
  }
}
