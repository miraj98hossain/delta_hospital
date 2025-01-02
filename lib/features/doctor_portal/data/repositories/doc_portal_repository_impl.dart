import 'package:delta_hospital/app/data/data_sources/app_local_data_source.dart';
import 'package:delta_hospital/core/exceptions/api_exceptions.dart';
import 'package:delta_hospital/features/doctor_portal/data/models/doctor_admitted_patient_list_response.dart';
import 'package:delta_hospital/features/doctor_portal/data/models/doctor_consultaion_gridlist_response.dart';
import 'package:delta_hospital/features/doctor_portal/data/models/doctor_shift_list_response.dart';

import '../../domain/repositories/doc_portal_repository.dart';
import '../data_sources/doc_portal_remote_data_source.dart';

class DocPortalRepositoryImpl implements DocPortalRepository {
  final DocPortalRemoteDataSource remoteDataSource;
  final AppLocalDataSource localDataSource;

  DocPortalRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<List<Shift>> getDoctorShiftByAccessToken() async {
    var token = await localDataSource.getAuthResponse();
    var response = await remoteDataSource.getDoctorShiftByAccessToken(
        token: token?.accessToken ?? '');
    if (response.success != true) {
      throw ApiDataException(
          response.message ?? "Error Occured While Fetching Doctor Shift");
    }
    return response.items ?? [];
  }

  @override
  Future<List<Consultation>> getDoctorConsultationList({
    required int doctorNo,
    required String fromDate,
    required int shiftdtlNo,
  }) async {
    var token = await localDataSource.getAuthResponse();
    var response = await remoteDataSource.getDoctorConsultationList(
        token: token?.accessToken ?? '',
        doctorNo: doctorNo,
        fromDate: fromDate,
        shiftdtlNo: shiftdtlNo);
    if (response.success != true) {
      throw ApiDataException(
          response.message ?? "Error Occured While Fetching Consultation List");
    }
    return response.obj?.data ?? [];
  }

  @override
  Future<List<AdmittedPatient>> getDoctorAdmittedPatientList(
      {required int doctorNo}) async {
    var token = await localDataSource.getAuthResponse();
    var response = await remoteDataSource.getDoctorAdmittedPatientList(
      token: token?.accessToken ?? '',
      doctorNo: doctorNo,
    );
    if (response.success != true) {
      throw ApiDataException(response.message ??
          "Error Occured While Fetching Admitted Patient List");
    }
    return response.items ?? [];
  }
}
