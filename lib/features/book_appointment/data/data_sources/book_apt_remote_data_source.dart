import 'package:delta_hospital/core/app_config.dart';

abstract class BookAptRemoteDataSource {}

class BookAptRemoteDataSourceImpl implements BookAptRemoteDataSource {
  final AppConfig _appConfig;

  BookAptRemoteDataSourceImpl({required AppConfig appConfig})
      : _appConfig = appConfig;
}
