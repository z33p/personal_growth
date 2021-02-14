import 'package:personal_grouth/Config/Database/MyDatabase.dart';
import 'package:personal_grouth/Filters/FilterAbstract.dart';
import 'package:personal_grouth/Model/Entity.dart';
import 'package:sqflite/sqflite.dart';

abstract class RepositoryAbstract<F extends FilterAbstract, E extends Entity> {
  Database database = MyDatabase.instance;

  Future<List<E>> findBy({ F filter });
}
