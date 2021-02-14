import "package:path/path.dart";
import 'package:personal_grouth/Model/Company.dart';
import 'package:personal_grouth/Model/Product.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
  static const String dbName = "personal_growth.db";
  static String dbPath = "";

  static Database instance;

  static Future<void> init() async {
    // deleteDbIfExists();
    instance = await getInstance();
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
  }

  static Future<void> deleteDbIfExists() async {
    if (dbPath.isEmpty) dbPath = join(await getDatabasesPath(), dbName);

    if (await databaseExists(dbPath)) await deleteDatabase(dbPath);
  }
}