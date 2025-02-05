import 'dart:typed_data';

import 'package:delta_hospital/app/data/data_sources/app_local_data_source.dart';
import 'package:delta_hospital/app/data/data_sources/app_remote_data_source.dart';
import 'package:delta_hospital/app/data/models/app_login_response.dart';
import 'package:delta_hospital/app/data/models/his_patient_info_response.dart';
import 'package:delta_hospital/app/data/models/patient_relation_list_response.dart';
import 'package:delta_hospital/core/exceptions/api_exceptions.dart';
import 'package:delta_hospital/features/patient_portal/data/data_sources/pat_portal_remote_data_source.dart';
import 'package:delta_hospital/features/patient_portal/data/models/patient_notes_gridlist_response.dart';
import 'package:delta_hospital/features/patient_portal/data/models/patient_prescription_gridlist_response.dart';
import 'package:delta_hospital/features/patient_portal/data/models/patient_report_gridlist_response.dart';
import 'package:delta_hospital/features/patient_portal/domain/repositories/pat_portal_repository.dart';

class PatPortalRepositoryImpl implements PatPortalRepository {
  final PatPortalRemoteDataSource patRemoteDataSource;
  final AppRemoteDataSource appRemoteDataSource;
  final AppLocalDataSource localDataSource;

  PatPortalRepositoryImpl({
    required this.patRemoteDataSource,
    required this.localDataSource,
    required this.appRemoteDataSource,
  });

  @override
  Future<HisPatientInfo> getPatientInfoByAccessToken() async {
    var token = await localDataSource.getAuthResponse();
    var response = await patRemoteDataSource.getPatientInfoByAccessToken(
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
    var response = await patRemoteDataSource.getPrescriptionByAccessToken(
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
    var response = await patRemoteDataSource.getReportByAccessToken(
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
    var response = await patRemoteDataSource.addNoteByAccessToken(
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
    var response = await patRemoteDataSource.getNotesByAccessToken(
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
        await appRemoteDataSource.getRegPatientInfo(mrnOrPhNo: mrnOrPhNo);
    if (response.success != true) {
      throw ApiDataException(
          response.message ?? "Error Occured While Fetching");
    }
    return response.obj ?? HisPatientInfo();
  }

  @override
  Future<HisPatientInfo> findRegAndCreateUser({
    required String mrn,
  }) async {
    var response = await patRemoteDataSource.findRegAndCreateUser(mrn: mrn);
    if (response.success != true) {
      throw ApiDataException(
          response.message ?? "Error Occured While Fetching");
    }
    return response.obj ?? HisPatientInfo();
  }

  @override
  Future<List<PatientRelation>> getPatientRelationList() async {
    var response = await appRemoteDataSource.getPatientRelationList();
    if (response.success != true) {
      throw ApiDataException(
          response.message ?? "Error Occured While Fetching");
    }
    return response.items ?? [];
  }

  @override
  Future<void> savePatientPortalUser({
    required AppUserDetails userDetails,
  }) async {
    var response = await appRemoteDataSource.savePatientPortalUser(
        userDetails: userDetails);
    if (response.success != true) {
      throw const ApiDataException("Error Occured While Sending SMS");
    }
  }

  @override
  Future<Uint8List> getPrescriptionPdf({
    required int prescriptionId,
  }) async {
    var token = await localDataSource.getAuthResponse();
    var response = await patRemoteDataSource.getPrescriptionPdf(
      token: token?.accessToken ?? '',
      prescriptionId: prescriptionId,
    );
    if (response.isEmpty) {
      throw const ApiDataException("No Pdf Data Found");
    }
    return response;
  }

  @override
  Future<void> previewPathReport({
    required String token,
    required Report report,
  }) async {
    var token = await localDataSource.getAuthResponse();
    var response = await patRemoteDataSource.previewPathReport(
      token: token?.accessToken ?? '',
      report: report,
    );
    if (response.success != true) {
      throw ApiDataException(
          response.message ?? "Error Occured While Fetching");
    }
  }
}
