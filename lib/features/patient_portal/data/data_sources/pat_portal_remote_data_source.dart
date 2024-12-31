import 'dart:convert';

import 'package:delta_hospital/app/data/models/his_patient_info_response.dart';
import 'package:delta_hospital/core/app_config.dart';
import 'package:delta_hospital/core/services/decoder_service_mixin.dart';
import 'package:delta_hospital/features/patient_portal/data/models/add_note_response.dart';
import 'package:delta_hospital/features/patient_portal/data/models/patient_notes_gridlist_response.dart';
import 'package:delta_hospital/features/patient_portal/data/models/patient_prescription_gridlist_response.dart';
import 'package:delta_hospital/features/patient_portal/data/models/patient_report_gridlist_response.dart';

import 'package:http/http.dart' as http;

abstract class PatPortalRemoteDataSource {
  Future<HisPatientInfoResponse> getPatientInfoByAccessToken(
      {required String token});
  Future<PatientPrescriptionGridListResponse> getPrescriptionByAccessToken({
    required String token,
    required int start,
    required int length,
  });
  Future<PatientReportGridListResponse> getReportByAccessToken({
    required String token,
    required int start,
    required int length,
  });
  Future<AddNoteResponse> addNoteByAccessToken({
    required String token,
    required String title,
    required String description,
  });
  Future<PatientNotesGridListResponse> getNotesByAccessToken({
    required String token,
    required int start,
    required int length,
  });
}

class PatPortalRemoteDataSourceImpl
    with DecoderServiceMixin
    implements PatPortalRemoteDataSource {
  final AppConfig _appConfig;

  PatPortalRemoteDataSourceImpl({required AppConfig appConfig})
      : _appConfig = appConfig;

  @override
  Future<HisPatientInfoResponse> getPatientInfoByAccessToken(
      {required String token}) async {
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'POST',
        Uri.parse(
            '${_appConfig.baseUrl}diagnostic-api/api/pat-investigation-report/find-hospitalNumber'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    return await decodeResponse(response,
        decoder: HisPatientInfoResponse.fromJson);
  }

  @override
  Future<PatientPrescriptionGridListResponse> getPrescriptionByAccessToken({
    required String token,
    required int start,
    required int length,
  }) async {
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'GET',
        Uri.parse(
            '${_appConfig.baseUrl}diagnostic-api/api/pat-investigation-report/patient-prescription-list?draw=1&columns%5B0%5D%5Bdata%5D=consultationId&columns%5B0%5D%5Bname%5D=consultationId&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=prescriptionDateTime&columns%5B1%5D%5Bname%5D=prescriptionDateTime&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=doctorName&columns%5B2%5D%5Bname%5D=doctorName&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B3%5D%5Bdata%5D=&columns%5B3%5D%5Bname%5D=&columns%5B3%5D%5Bsearchable%5D=true&columns%5B3%5D%5Borderable%5D=true&columns%5B3%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B3%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=desc&start=$start&length=$length&search%5Bvalue%5D=&search%5Bregex%5D=false&_=1698817789237'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    return await decodeResponse(response,
        decoder: PatientPrescriptionGridListResponse.fromJson);
  }

  @override
  Future<PatientReportGridListResponse> getReportByAccessToken(
      {required String token, required int start, required int length}) async {
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'GET',
        Uri.parse(
            '${_appConfig.baseUrl}diagnostic-api/api/pat-investigation-report/gridList?draw=2&columns%5B0%5D%5Bdata%5D=invoiceNo&columns%5B0%5D%5Bname%5D=invoiceNo&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=invoiceId&columns%5B1%5D%5Bname%5D=invoiceId&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=itemName&columns%5B2%5D%5Bname%5D=itemName&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B3%5D%5Bdata%5D=itemTypeName&columns%5B3%5D%5Bname%5D=itemTypeName&columns%5B3%5D%5Bsearchable%5D=true&columns%5B3%5D%5Borderable%5D=true&columns%5B3%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B3%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B4%5D%5Bdata%5D=billStatus&columns%5B4%5D%5Bname%5D=billStatus&columns%5B4%5D%5Bsearchable%5D=true&columns%5B4%5D%5Borderable%5D=true&columns%5B4%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B4%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B5%5D%5Bdata%5D=isReady&columns%5B5%5D%5Bname%5D=&columns%5B5%5D%5Bsearchable%5D=true&columns%5B5%5D%5Borderable%5D=false&columns%5B5%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B5%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B6%5D%5Bdata%5D=itemWiseDeliveryDate&columns%5B6%5D%5Bname%5D=&columns%5B6%5D%5Bsearchable%5D=true&columns%5B6%5D%5Borderable%5D=false&columns%5B6%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B6%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B7%5D%5Bdata%5D=billStatus&columns%5B7%5D%5Bname%5D=&columns%5B7%5D%5Bsearchable%5D=true&columns%5B7%5D%5Borderable%5D=true&columns%5B7%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B7%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=desc&start=$start&length=$length&search%5Bvalue%5D=&search%5Bregex%5D=false&_=1735567720585'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return await decodeResponse(response,
        decoder: PatientReportGridListResponse.fromJson);
  }

  @override
  Future<AddNoteResponse> addNoteByAccessToken(
      {required String token,
      required String title,
      required String description}) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            '${_appConfig.baseUrl}diagnostic-api/api/patient-notes/create'));
    request.body =
        json.encode({"patNoteTitle": title, "patNoteDetail": description});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return await decodeResponse(response, decoder: AddNoteResponse.fromJson);
  }

  @override
  Future<PatientNotesGridListResponse> getNotesByAccessToken(
      {required String token, required int start, required int length}) async {
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'GET',
        Uri.parse(
            '${_appConfig.baseUrl}diagnostic-api/api/patient-notes/grid-list?draw=3&columns%5B0%5D%5Bdata%5D=patNoteTitle&columns%5B0%5D%5Bname%5D=patNoteTitle&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=patNoteDetail&columns%5B1%5D%5Bname%5D=patNoteDetail&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=asc&start=$start&length=$length&search%5Bvalue%5D=&search%5Bregex%5D=false&_=1735653598576'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return await decodeResponse(response,
        decoder: PatientNotesGridListResponse.fromJson);
  }
}
