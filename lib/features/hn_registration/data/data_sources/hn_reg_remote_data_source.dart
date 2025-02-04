import 'package:delta_hospital/core/app_config.dart';
import 'package:delta_hospital/core/services/decoder_service_mixin.dart';

import 'package:http/http.dart' as http;

abstract class HnRegRemoteDataSource {
  // Future<HisPatientInfoResponse> getPatientInfoByAccessToken(
  //     {required String token});
}

class HnRegRemoteDataSourceImpl
    with DecoderServiceMixin
    implements HnRegRemoteDataSource {
  final AppConfig _appConfig;

  HnRegRemoteDataSourceImpl({required AppConfig appConfig})
      : _appConfig = appConfig;

  // @override
  // Future<HisPatientInfoResponse> getPatientInfoByAccessToken(
  //     {required String token}) async {
  //   var headers = {'Authorization': 'Bearer $token'};
  //   var request = http.Request(
  //       'POST',
  //       Uri.parse(
  //           '${_appConfig.baseUrl}diagnostic-api/api/pat-investigation-report/find-hospitalNumber'));

  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();
  //   return await decodeResponse(response,
  //       decoder: HisPatientInfoResponse.fromJson);
  // }
}
