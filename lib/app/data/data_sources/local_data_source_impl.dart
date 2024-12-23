import 'package:sembast/sembast.dart';

abstract class LocalDataSource {}

class LocalDataSourceImpl implements LocalDataSource {
  final Database _database;

  LocalDataSourceImpl({required Database database}) : _database = database;
}
