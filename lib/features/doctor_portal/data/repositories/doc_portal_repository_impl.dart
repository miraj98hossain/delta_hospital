import 'package:delta_hospital/app/data/data_sources/app_local_data_source.dart';

import '../../domain/repositories/doc_portal_repository.dart';
import '../data_sources/doc_portal_remote_data_source.dart';

class DocPortalRepositoryImpl implements DocPortalRepository {
  final DocPortalRemoteDataSource remoteDataSource;
  final AppLocalDataSource localDataSource;

  DocPortalRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  // @override
  // Future<HisPatientInfo> getPatientInfoByAccessToken() async {
  //   var token = await localDataSource.getAuthResponse();
  //   var response = await remoteDataSource.getPatientInfoByAccessToken(
  //       token: token?.accessToken ?? '');
  //   if (response.success != true) {
  //     throw ApiDataException(
  //         response.message ?? "Error Occured While Fetching");
  //   }
  //   return response.obj ?? HisPatientInfo();
  // }
}
