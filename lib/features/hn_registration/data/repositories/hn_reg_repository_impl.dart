import 'package:delta_hospital/app/data/data_sources/app_local_data_source.dart';
import 'package:delta_hospital/app/data/data_sources/app_remote_data_source.dart';
import 'package:delta_hospital/features/hn_registration/data/data_sources/hn_reg_remote_data_source.dart';

import 'package:delta_hospital/features/hn_registration/domain/repositories/hn_reg_repository.dart';

class HnRegRepositoryImpl implements HnRegRepository {
  final HnRegRemoteDataSource hnRegRemoteDataSource;
  final AppRemoteDataSource appRemoteDataSource;
  final AppLocalDataSource localDataSource;

  HnRegRepositoryImpl({
    required this.hnRegRemoteDataSource,
    required this.localDataSource,
    required this.appRemoteDataSource,
  });
}
