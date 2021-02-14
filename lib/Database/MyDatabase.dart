import "package:path/path.dart";
import 'package:personal_grouth/Models/Company.dart';
import 'package:personal_grouth/Models/Product.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
  static Future<Database> init() async {
    var dbPath = join(await getDatabasesPath(), "personal_growth.db");

    deleteDbIfExists(dbPath);

    final Future<Database> database = openDatabase(
      dbPath
      , onConfigure: onConfigure
      , onCreate: onCreate
      , version: 1
    );

    return database;
  }

  static void onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  static void onCreate(Database db, int version) async {
    await Company.createTable(db);
    await Product.createTable(db);
  }

  static Future<void> deleteDbIfExists(String path) async {
    if (await databaseExists(path))
      return await deleteDatabase(path);
  }
}
