import 'dart:convert';

import 'package:delta_hospital/core/app_config.dart';
import 'package:delta_hospital/core/services/decoder_service_mixin.dart';
import 'package:delta_hospital/features/doctor_portal/data/models/doctor_admitted_patient_list_response.dart';
import 'package:delta_hospital/features/doctor_portal/data/models/doctor_consultaion_gridlist_response.dart';
import 'package:delta_hospital/features/doctor_portal/data/models/doctor_shift_list_response.dart';
import 'package:http/http.dart' as http;

abstract class DocPortalRemoteDataSource {
  Future<DoctorShiftListResponse> getDoctorShiftByAccessToken(
      {required String token});
  Future<DoctorConsultationGridListResponse> getDoctorConsultationList({
    required String token,
    required int doctorNo,
    required String fromDate,
    required int shiftdtlNo,
  });
  Future<DoctorAdmittedPatientListResponse> getDoctorAdmittedPatientList({
    required String token,
    required int doctorNo,
  });
}

class DocPortalRemoteDataSourceImpl
    with DecoderServiceMixin
    implements DocPortalRemoteDataSource {
  final AppConfig _appConfig;

  DocPortalRemoteDataSourceImpl({required AppConfig appConfig})
      : _appConfig = appConfig;

  @override
  Future<DoctorShiftListResponse> getDoctorShiftByAccessToken(
      {required String token}) async {
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'GET',
        Uri.parse(
            '${_appConfig.baseUrl}diagnostic-api/api/opd-consultation/shift-list'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return await decodeResponse(response,
        decoder: DoctorShiftListResponse.fromJson);
  }

  @override
  Future<DoctorConsultationGridListResponse> getDoctorConsultationList(
      {required String token,
      required int doctorNo,
      required String fromDate,
      required int shiftdtlNo}) async {
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var url =
        '${_appConfig.baseUrl}prescription-service-api/api/consultation/gridList?draw=4&columns%5B0%5D%5Bdata%5D=0&columns%5B0%5D%5Bname%5D=&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=startTime&columns%5B1%5D%5Bname%5D=&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=hospitalId&columns%5B2%5D%5Bname%5D=hospitalId&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B3%5D%5Bdata%5D=patientName&columns%5B3%5D%5Bname%5D=patientName&columns%5B3%5D%5Bsearchable%5D=true&columns%5B3%5D%5Borderable%5D=true&columns%5B3%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B3%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B4%5D%5Bdata%5D=age&columns%5B4%5D%5Bname%5D=&columns%5B4%5D%5Bsearchable%5D=true&columns%5B4%5D%5Borderable%5D=true&columns%5B4%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B4%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B5%5D%5Bdata%5D=gender&columns%5B5%5D%5Bname%5D=gender&columns%5B5%5D%5Bsearchable%5D=true&columns%5B5%5D%5Borderable%5D=true&columns%5B5%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B5%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B6%5D%5Bdata%5D=phoneMobile&columns%5B6%5D%5Bname%5D=phoneMobile&columns%5B6%5D%5Bsearchable%5D=true&columns%5B6%5D%5Borderable%5D=true&columns%5B6%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B6%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B7%5D%5Bdata%5D=consultationId&columns%5B7%5D%5Bname%5D=consultationId&columns%5B7%5D%5Bsearchable%5D=true&columns%5B7%5D%5Borderable%5D=true&columns%5B7%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B7%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B8%5D%5Bdata%5D=consultationConfirmBy&columns%5B8%5D%5Bname%5D=&columns%5B8%5D%5Bsearchable%5D=true&columns%5B8%5D%5Borderable%5D=true&columns%5B8%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B8%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B9%5D%5Bdata%5D=consultationConfirmTime&columns%5B9%5D%5Bname%5D=&columns%5B9%5D%5Bsearchable%5D=true&columns%5B9%5D%5Borderable%5D=true&columns%5B9%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B9%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B10%5D%5Bdata%5D=10&columns%5B10%5D%5Bname%5D=&columns%5B10%5D%5Bsearchable%5D=true&columns%5B10%5D%5Borderable%5D=false&columns%5B10%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B10%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=ASC&start=0&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&shiftdtlNo=$shiftdtlNo&fromDate=$fromDate&toDate=$fromDate&doctorNo=$doctorNo';
    var request = http.Request(
      'GET',
      Uri.parse(url),
    );
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return decodeResponse<DoctorConsultationGridListResponse>(
      response,
      decoder: DoctorConsultationGridListResponse.fromJson,
    );
  }

  @override
  Future<DoctorAdmittedPatientListResponse> getDoctorAdmittedPatientList(
      {required String token, required int doctorNo}) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            '${_appConfig.baseUrl}doctor-nurse-station-api/api/patient/admittedPatients-by-doctorNo'));
    request.body = json.encode({"doctorNo": doctorNo});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return await decodeResponse(response,
        decoder: DoctorAdmittedPatientListResponse.fromJson);
  }
}
