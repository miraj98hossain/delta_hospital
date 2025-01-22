import 'dart:convert';

import 'package:delta_hospital/core/app_config.dart';
import 'package:delta_hospital/core/services/decoder_service_mixin.dart';
import 'package:delta_hospital/features/doctor_portal/data/models/doctor_admitted_patient_list_response.dart';
import 'package:delta_hospital/features/doctor_portal/data/models/doctor_consultaion_gridlist_response.dart';
import 'package:delta_hospital/features/doctor_portal/data/models/doctor_shift_list_response.dart';
import 'package:http/http.dart' as http;

abstract class MngPortalRemoteDataSource {
  // Future<DoctorShiftListResponse> getDoctorShiftByAccessToken(
  //     {required String token});
}

class MngPortalRemoteDataSourceImpl
    with DecoderServiceMixin
    implements MngPortalRemoteDataSource {
  final AppConfig _appConfig;

  MngPortalRemoteDataSourceImpl({required AppConfig appConfig})
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
}
