import 'package:delta_hospital/app/data/data_sources/local_data_source.dart';
import 'package:sembast/sembast.dart';

class LocalDataSourceImpl implements LocalDataSource {
  final Database _database;

  LocalDataSourceImpl({required Database database}) : _database = database;
}
