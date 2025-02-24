import 'package:delta_hospital/app/data/data_sources/app_local_data_source.dart';
import 'package:delta_hospital/app/data/data_sources/app_remote_data_source.dart';
import 'package:delta_hospital/core/exceptions/api_exceptions.dart';
import 'package:delta_hospital/features/hn_registration/data/data_sources/hn_reg_remote_data_source.dart';
import 'package:delta_hospital/features/hn_registration/data/models/hn_registration.dart';
import 'package:delta_hospital/features/hn_registration/data/models/hn_registration_fee_response.dart';
import 'package:delta_hospital/features/hn_registration/data/models/hn_registration_response.dart';

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

  @override
  Future<RegistrationFee> getHnRegistrationFee() async {
    var response = await hnRegRemoteDataSource.getHnRegistrationFee();
    if (response.success != true) {
      throw ApiDataException(
          response.message ?? "Error Occured While Fetching");
    }
    return response.obj ?? RegistrationFee();
  }

  @override
  Future<HnInfo> registerHn({required HnRegistration hnRegistration}) async {
    var response =
        await hnRegRemoteDataSource.registerHn(hnRegistration: hnRegistration);
    if (response.success != true) {
      throw ApiDataException(
          response.message ?? "Error Occured While Fetching");
    }
    return response.model ?? HnInfo();
  }
}
