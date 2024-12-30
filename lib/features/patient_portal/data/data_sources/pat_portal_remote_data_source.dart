import 'dart:convert';
import 'package:delta_hospital/app/data/models/his_patient_info_response.dart';
import 'package:delta_hospital/core/app_config.dart';
import 'package:delta_hospital/core/services/decoder_service_mixin.dart';

import 'package:http/http.dart' as http;

abstract class PatPortalRemoteDataSource {
  Future<HisPatientInfoResponse> getPatientInfoByAccessToken(
      {required String token});
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
}
