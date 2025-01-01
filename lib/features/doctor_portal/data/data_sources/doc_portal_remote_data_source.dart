import 'dart:convert';

import 'package:delta_hospital/core/app_config.dart';
import 'package:delta_hospital/core/services/decoder_service_mixin.dart';
import 'package:http/http.dart' as http;

abstract class DocPortalRemoteDataSource {
  // Future<HisPatientInfoResponse> getPatientInfoByAccessToken(
  //     {required String token});
}

class DocPortalRemoteDataSourceImpl
    with DecoderServiceMixin
    implements DocPortalRemoteDataSource {
  final AppConfig _appConfig;

  DocPortalRemoteDataSourceImpl({required AppConfig appConfig})
      : _appConfig = appConfig;
}
