import 'package:delta_hospital/app/data/data_sources/app_local_data_source.dart';
import 'package:delta_hospital/app/data/data_sources/app_remote_data_source.dart';
import 'package:delta_hospital/app/data/models/auth_response.dart';
import 'package:delta_hospital/app/data/models/user_details_response.dart';
import 'package:delta_hospital/app/data/repositories/app_repository.dart';
import 'package:delta_hospital/core/exceptions/custom_exception.dart';

class AppRepositoryImpl implements AppRepository {
  final AppRemoteDataSource appRemoteDataSource;
  final AppLocalDataSource appLocalDataSource;

  AppRepositoryImpl({
    required this.appRemoteDataSource,
    required this.appLocalDataSource,
  });

  @override
  Future<void> clearAuthResponse() async {
    await appLocalDataSource.clearAuthResponse();
  }

  @override
  Future<AuthResponse> getAuthResponse() async {
    var response = await appLocalDataSource.getAuthResponse();
    if (response == null) {
      throw const CustomException('No AuthResponse found');
    }
    return response;
  }

  @override
  Future<void> saveAuthResponse({required AuthResponse response}) async {
    await appLocalDataSource.saveAuthResponse(response: response);
  }

  @override
  Future<AuthResponse> authenticate({
    required String userName,
    required String password,
  }) async {
    var response = await appRemoteDataSource.authenticate(
      userName: userName,
      password: password,
    );
    if (response.accessToken == null) {
      throw Exception('No Token Found');
    }
    await saveAuthResponse(response: response);
    return response;
  }

  @override
  Future<UserDetails> getUserDetails() async {
    var auth = await getAuthResponse();

    var response =
        await appRemoteDataSource.getUserDetails(token: auth.accessToken!);
    if (response.success != true) {
      throw CustomException(response.message);
    }
    await saveHisUser(userDetails: response.obj!);
    return response.obj ?? UserDetails();
  }

  @override
  Future<void> clearHisUser() async {
    await appLocalDataSource.clearHisUser();
  }

  @override
  Future<UserDetails> getHisUser() async {
    var response = await appLocalDataSource.getHisUser();
    if (response == null) {
      throw const CustomException('No His User found');
    }
    return response;
  }

  @override
  Future<void> saveHisUser({required UserDetails userDetails}) async {
    await appLocalDataSource.saveHisUser(userDetails: userDetails);
  }
}
