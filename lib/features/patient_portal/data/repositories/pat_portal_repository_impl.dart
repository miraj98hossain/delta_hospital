import 'package:delta_hospital/app/data/data_sources/app_local_data_source.dart';
import 'package:delta_hospital/features/patient_portal/data/data_sources/pat_portal_remote_data_source.dart';
import 'package:delta_hospital/features/patient_portal/domain/repositories/pat_portal_repository.dart';

class PatPortalRepositoryImpl implements PatPortalRepository {
  final PatPortalRemoteDataSource remoteDataSource;
  final AppLocalDataSource localDataSource;

  PatPortalRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});
}
