import 'dart:developer';

import 'package:delta_hospital/core/app_config.dart';
import 'package:delta_hospital/core/services/decoder_service_mixin.dart';
import 'package:delta_hospital/data/models/hn_registration.dart';
import 'package:delta_hospital/data/models/hn_registration_fee_response.dart';
import 'package:delta_hospital/data/models/hn_registration_response.dart';

import 'package:http/http.dart' as http;

abstract class HnRegRemoteDataSource {
  Future<HnRegistrationFeeResponse> getHnRegistrationFee();
  Future<HnRegistrationResponse> registerHn(
      {required HnRegistration hnRegistration});
}

class HnRegRemoteDataSourceImpl
    with DecoderServiceMixin
    implements HnRegRemoteDataSource {
  final AppConfig _appConfig;

  HnRegRemoteDataSourceImpl({required AppConfig appConfig})
      : _appConfig = appConfig;

  @override
  Future<HnRegistrationFeeResponse> getHnRegistrationFee() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            '${_appConfig.baseUrl}online-appointment-api/fapi/mrnregistration/find-card-reg-fee'));

    http.StreamedResponse response = await request.send();
    return await decodeResponse<HnRegistrationFeeResponse>(response,
        decoder: HnRegistrationFeeResponse.fromJson);
  }

  @override
  Future<HnRegistrationResponse> registerHn(
      {required HnRegistration hnRegistration}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            '${_appConfig.baseUrl}online-appointment-api/fapi/mrnregistration/save-card'));
    request.body = hnRegistration.toJson();
    request.headers.addAll(headers);
    log(request.body);
    http.StreamedResponse response = await request.send();

    return await decodeResponse<HnRegistrationResponse>(response,
        decoder: HnRegistrationResponse.fromJson);
  }
}
