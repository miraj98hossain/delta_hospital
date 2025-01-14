import 'package:delta_hospital/app/data/data_sources/app_local_data_source.dart';
import 'package:delta_hospital/app/data/models/his_patient_info_response.dart';
import 'package:delta_hospital/core/exceptions/api_exceptions.dart';
import 'package:delta_hospital/features/patient_portal/data/data_sources/pat_portal_remote_data_source.dart';
import 'package:delta_hospital/features/patient_portal/data/models/patient_notes_gridlist_response.dart';
import 'package:delta_hospital/features/patient_portal/data/models/patient_prescription_gridlist_response.dart';
import 'package:delta_hospital/features/patient_portal/data/models/patient_report_gridlist_response.dart';
import 'package:delta_hospital/features/patient_portal/domain/repositories/pat_portal_repository.dart';

class PatPortalRepositoryImpl implements PatPortalRepository {
  final PatPortalRemoteDataSource remoteDataSource;
  final AppLocalDataSource localDataSource;

  PatPortalRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<HisPatientInfo> getPatientInfoByAccessToken() async {
    var token = await localDataSource.getAuthResponse();
    var response = await remoteDataSource.getPatientInfoByAccessToken(
        token: token?.accessToken ?? '');
    if (response.success != true) {
      throw ApiDataException(
          response.message ?? "Error Occured While Fetching");
    }
    return response.obj ?? HisPatientInfo();
  }

  @override
  Future<PrescriptionGridList> getPrescriptionByAccessToken(
      {required int start, required int length}) async {
    var token = await localDataSource.getAuthResponse();
    var response = await remoteDataSource.getPrescriptionByAccessToken(
        token: token?.accessToken ?? '', start: start, length: length);
    if (response.success != true) {
      throw ApiDataException(
          response.message ?? "Error Occured While Fetching");
    }
    return response.obj ?? PrescriptionGridList();
  }

  @override
  Future<ReportGridList> getReportByAccessToken(
      {required int start, required int length}) async {
    var token = await localDataSource.getAuthResponse();
    var response = await remoteDataSource.getReportByAccessToken(
        token: token?.accessToken ?? '', start: start, length: length);
    if (response.success != true) {
      throw ApiDataException(
          response.message ?? "Error Occured While Fetching");
    }
    return response.obj ?? ReportGridList();
  }

  @override
  Future<void> addNoteByAccessToken(
      {required String title, required String description}) async {
    var token = await localDataSource.getAuthResponse();
    var response = await remoteDataSource.addNoteByAccessToken(
        token: token?.accessToken ?? '',
        title: title,
        description: description);
    if (response.success != true) {
      throw ApiDataException(
        response.message ?? "Error Occured While Adding Note",
      );
    }
  }

  @override
  Future<NotesGridList> getNotesByAccessToken(
      {required int start, required int length}) async {
    var token = await localDataSource.getAuthResponse();
    var response = await remoteDataSource.getNotesByAccessToken(
        token: token?.accessToken ?? '', start: start, length: length);
    if (response.success != true) {
      throw ApiDataException(
          response.message ?? "Error Occured While Fetching");
    }
    return response.obj ?? NotesGridList();
  }

  @override
  Future<HisPatientInfo> getRegPatientInfo({
    required String mrnOrPhNo,
  }) async {
    var response =
        await remoteDataSource.getRegPatientInfo(mrnOrPhNo: mrnOrPhNo);
    if (response.success != true) {
      throw ApiDataException(
          response.message ?? "Error Occured While Fetching");
    }
    return response.obj ?? HisPatientInfo();
  }
}
