import 'package:delta_hospital/app/data/data_sources/app_local_data_source.dart';

import '../../domain/repositories/mng_portal_repository.dart';
import '../data_sources/mng_portal_remote_data_source.dart';

class MngPortalRepositoryImpl implements MngPortalRepository {
  final MngPortalRemoteDataSource remoteDataSource;
  final AppLocalDataSource localDataSource;

  MngPortalRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});
}
