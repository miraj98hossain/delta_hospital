import 'package:delta_hospital/data/data_sources/app_local_data_source.dart';
import 'package:delta_hospital/core/exceptions/api_exceptions.dart';
import 'package:delta_hospital/data/models/financial_dash_report_response.dart';
import 'package:delta_hospital/data/models/opd_ipd_patient_report_response.dart';

import '../../domain/repositories/mng_portal_repository.dart';
import '../data_sources/mng_portal_remote_data_source.dart';

class MngPortalRepositoryImpl implements MngPortalRepository {
  final MngPortalRemoteDataSource remoteDataSource;
  final AppLocalDataSource localDataSource;

  MngPortalRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  @override
  Future<List<PatientReport>> findOpdIpdPatientReport({
    required String fromDate,
    required String toDate,
  }) async {
    var response = await remoteDataSource.findOpdIpdPatientReport(
        fromDate: fromDate, toDate: toDate);
    if (response.success != true) {
      throw ApiDataException(
          response.message ?? "Error Occured While Fetching");
    }
    return response.items ?? [];
  }

  @override
  Future<List<FinancialReport>> findFinancialDashReport({
    required String fromDate,
    required String toDate,
  }) async {
    var response = await remoteDataSource.findFinancialDashReport(
        fromDate: fromDate, toDate: toDate);
    if (response.success != true) {
      throw ApiDataException(
          response.message ?? "Error Occured While Fetching");
    }
    return response.items ?? [];
  }
}
