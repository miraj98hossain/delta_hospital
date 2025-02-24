import 'dart:convert';

import 'package:delta_hospital/core/app_config.dart';
import 'package:delta_hospital/core/services/decoder_service_mixin.dart';
import 'package:delta_hospital/presentations/management/data/models/financial_dash_report_response.dart';

import 'package:delta_hospital/presentations/management/data/models/opd_ipd_patient_report_response.dart';
import 'package:http/http.dart' as http;

abstract class MngPortalRemoteDataSource {
  Future<OpdIpdPatientReportResponse> findOpdIpdPatientReport({
    required String fromDate,
    required String toDate,
  });
  Future<FinancialDashReportResponse> findFinancialDashReport({
    required String fromDate,
    required String toDate,
  });
}

class MngPortalRemoteDataSourceImpl
    with DecoderServiceMixin
    implements MngPortalRemoteDataSource {
  final AppConfig _appConfig;

  MngPortalRemoteDataSourceImpl({required AppConfig appConfig})
      : _appConfig = appConfig;

  @override
  Future<OpdIpdPatientReportResponse> findOpdIpdPatientReport({
    required String fromDate,
    required String toDate,
  }) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            '${_appConfig.baseUrl}online-appointment-api/fapi/opdipdpatient/find-opd-ipd-patient'));
    request.body = json.encode({
      "fromDate": fromDate,
      "toDate": toDate,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    return await decodeResponse(
      response,
      decoder: OpdIpdPatientReportResponse.fromJson,
    );
  }

  @override
  Future<FinancialDashReportResponse> findFinancialDashReport(
      {required String fromDate, required String toDate}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            '${_appConfig.baseUrl}online-appointment-api/fapi/financialdashboard/find-financial-dashboard'));
    request.body = json.encode({"fromDate": fromDate, "toDate": toDate});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    return await decodeResponse(
      response,
      decoder: FinancialDashReportResponse.fromJson,
    );
  }
}
