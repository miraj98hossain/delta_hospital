import 'package:delta_hospital/core/app_config.dart';

abstract class AppRemoteDataSource {}

class AppRemoteDataSourceImpl implements AppRemoteDataSource {
  final AppConfig appConfig;

  AppRemoteDataSourceImpl({
    required this.appConfig,
  });
}
