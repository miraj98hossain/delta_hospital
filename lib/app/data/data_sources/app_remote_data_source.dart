import 'package:delta_hospital/app/data/models/auth_response.dart';
import 'package:delta_hospital/app/data/models/his_logout_response.dart';
import 'package:delta_hospital/app/data/models/user_details_response.dart';
import 'package:delta_hospital/core/app_config.dart';
import 'package:delta_hospital/core/services/decoder_service_mixin.dart';
import 'package:http/http.dart' as http;

abstract class AppRemoteDataSource {
  Future<AuthResponse> authenticate({
    required String userName,
    required String password,
  });
  Future<UserDetailsResponse> getUserDetails({
    required String token,
  });
  Future<HisLogoutResponse> hisUserlogout({
    required String token,
  });
}

class AppRemoteDataSourceImpl
    with DecoderServiceMixin
    implements AppRemoteDataSource {
  final AppConfig appConfig;

  AppRemoteDataSourceImpl({
    required this.appConfig,
  });

  @override
  Future<AuthResponse> authenticate(
      {required String userName, required String password}) async {
    var headers = {
      'Authorization': 'Basic bWVkQ2xpZW50SWRQYXNzd29yZDpzZWNyZXQ='
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${appConfig.baseUrl}auth-api/oauth/token'));
    request.fields.addAll({
      'username': userName,
      'password': password,
      'grant_type': 'password',
      'client_id': 'medClientIdPassword'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    return await decodeResponse(response, decoder: AuthResponse.fromJson);
  }

  @override
  Future<UserDetailsResponse> getUserDetails({required String token}) async {
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request('GET',
        Uri.parse('${appConfig.baseUrl}auth-api/api/coreUser/user-details'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return await decodeResponse(response,
        decoder: UserDetailsResponse.fromJson);
  }

  @override
  Future<HisLogoutResponse> hisUserlogout({required String token}) async {
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('${appConfig.baseUrl}auth-api/oauth/token/logout'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return await decodeResponse(response, decoder: HisLogoutResponse.fromJson);
  }
}
