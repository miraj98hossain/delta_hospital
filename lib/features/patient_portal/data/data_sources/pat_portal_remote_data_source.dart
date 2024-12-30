import 'dart:convert';
import 'package:delta_hospital/core/app_config.dart';
import 'package:delta_hospital/core/services/decoder_service_mixin.dart';

import 'package:http/http.dart' as http;

abstract class PatPortalRemoteDataSource {}

class PatPortalRemoteDataSourceImpl
    with DecoderServiceMixin
    implements PatPortalRemoteDataSource {
  final AppConfig _appConfig;

  PatPortalRemoteDataSourceImpl({required AppConfig appConfig})
      : _appConfig = appConfig;
}
