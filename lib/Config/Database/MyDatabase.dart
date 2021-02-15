import "package:path/path.dart";
import 'package:personal_grouth/Model/Company.dart';
import 'package:personal_grouth/Model/CompanyProduct.dart';
import 'package:personal_grouth/Model/Product.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
  static const String dbName = "personal_growth.db";
  static String dbPath = "";

  static Database instance;

  static Future<void> init() async {
    // deleteDbIfExists();
    instance = await getInstance();

    // await instance.insert(Product.tableName, Product.make(name: "Minecraft", price: 140).toMap());
    // await instance.insert(Product.tableName, Product.make(name: "Windows", price: 35).toMap());
    // await instance.insert(Product.tableName, Product.make(name: "Minecraft", price: 0).toMap());
  }

  static Future<Database> getInstance() async {
    if (instance != null) return instance;

    if (dbPath.isEmpty) dbPath = join(await getDatabasesPath(), dbName);

    final database = openDatabase(dbPath,
        onConfigure: onConfigure, onCreate: onCreate, version: 1);

    return database;
  }

  static void onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  static void onCreate(Database db, int version) async {
    await Company.createTable(db);
    await Product.createTable(db);
    await CompanyProduct.createTable(db);
  }

  static Future<void> deleteDbIfExists() async {
    if (dbPath.isEmpty) dbPath = join(await getDatabasesPath(), dbName);

    if (await databaseExists(dbPath)) await deleteDatabase(dbPath);
  }
}
