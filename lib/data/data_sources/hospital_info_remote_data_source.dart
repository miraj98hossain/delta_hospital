import 'package:delta_hospital/core/app_config.dart';
import 'package:delta_hospital/core/services/decoder_service_mixin.dart';

import 'package:delta_hospital/data/models/lookup_response.dart';

import 'package:http/http.dart' as http;

abstract class HospitalInfoRemoteDataSource {
  Future<LookUpResponse> getLookUpByNo({required int lookupNo});
}

class HospitalInfoRemoteDataSourceImpl
    with DecoderServiceMixin
    implements HospitalInfoRemoteDataSource {
  final AppConfig _appConfig;

  HospitalInfoRemoteDataSourceImpl({required AppConfig appConfig})
      : _appConfig = appConfig;

  @override
  Future<LookUpResponse> getLookUpByNo({required int lookupNo}) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            '${_appConfig.baseUrl}mobile-app-firebase-api/api/lookup/find-by-lookup-type-no/$lookupNo'));

    http.StreamedResponse response = await request.send();

    return await decodeResponse(response, decoder: LookUpResponse.fromJson);
  }
}
