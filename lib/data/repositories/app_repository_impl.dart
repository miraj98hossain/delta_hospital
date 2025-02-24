import 'package:delta_hospital/data/data_sources/app_local_data_source.dart';
import 'package:delta_hospital/data/data_sources/app_remote_data_source.dart';
import 'package:delta_hospital/data/models/app_login_response.dart';
import 'package:delta_hospital/data/models/auth_response.dart';
import 'package:delta_hospital/data/models/his_patient_info_response.dart';
import 'package:delta_hospital/data/models/patient_portal_user_list_response.dart';
import 'package:delta_hospital/data/models/paymode_list_response.dart';
import 'package:delta_hospital/data/models/user_details_response.dart';
import 'package:delta_hospital/domain/repositories/app_repository.dart';
import 'package:delta_hospital/core/exceptions/api_exceptions.dart';
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
    await saveHisSessionExpiryTime(
      dateTime: DateTime.now().add(
        const Duration(
          minutes: 45,
        ),
      ),
    );
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
  Future<void> clearAppUser() async {
    await appLocalDataSource.clearAppUser();
  }

  @override
  Future<void> clearHisUser() async {
    await appLocalDataSource.clearHisUser();
  }

  @override
  Future<AppUserDetails> getAppUser() async {
    var response = await appLocalDataSource.getAppUser();
    if (response == null) {
      throw const CustomException('No His User found');
    }
    return response;
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
  Future<void> saveAppUser({required AppUserDetails userDetails}) async {
    await appLocalDataSource.saveAppUser(appUserDetails: userDetails);
  }

  @override
  Future<void> saveHisUser({required UserDetails userDetails}) async {
    await appLocalDataSource.saveHisUser(userDetails: userDetails);
  }

  @override
  Future<void> clearHisSessionExpiryTime() async {
    await appLocalDataSource.clearHisSessionExpiryTime();
  }

  @override
  Future<DateTime> getHisSessionExpiryTime() async {
    var response = await appLocalDataSource.getHisSessionExpiryTime();
    if (response == null) {
      throw const CustomException('No His Session Expiry Time found');
    }
    return response;
  }

  @override
  Future<void> saveHisSessionExpiryTime({required DateTime dateTime}) async {
    await appLocalDataSource.saveHisSessionExpiryTime(dateTime: dateTime);
  }

  @override
  Future<void> hisUserlogout() async {
    var token = await getAuthResponse();
    var response =
        await appRemoteDataSource.hisUserlogout(token: token.accessToken ?? '');
    if (response.success != true) {
      throw ApiDataException(response.message);
    }
    await clearAuthResponse();
    await clearHisUser();
    await clearHisSessionExpiryTime();
  }

  @override
  Future<AppUserDetails> appLogin({
    required String phone,
    required String password,
  }) async {
    var response =
        await appRemoteDataSource.appLogin(phone: phone, password: password);
    if (response.success != true) {
      throw ApiDataException(response.message);
    }
    await saveAppUser(userDetails: response.obj!);
    return response.obj ?? AppUserDetails();
  }

  @override
  Future<void> applogout() async {
    await clearAuthResponse();
    await clearHisUser();
    await clearHisSessionExpiryTime();
    await clearAppUser();
  }

  @override
  Future<void> appRegistration({required AppUserDetails userDetails}) async {
    var response =
        await appRemoteDataSource.appRegistration(userDetails: userDetails);
    if (response.success != true) {
      throw ApiDataException(response.message);
    }
  }

  @override
  Future<void> sendSms({
    required String phone,
    required String message,
  }) async {
    var response =
        await appRemoteDataSource.sendSms(phone: phone, message: message);
    if (response.status != "0") {
      throw const ApiDataException("Error Occured While Sending SMS");
    }
  }

  @override
  Future<void> savePatientPortalUser({
    required AppUserDetails userDetails,
  }) async {
    var response = await appRemoteDataSource.savePatientPortalUser(
        userDetails: userDetails);
    if (response.success != true) {
      throw const ApiDataException("Error Occured While Sending SMS");
    }
  }

  @override
  Future<List<PatientPortalUser>> findPatientPortalUserByRefId({
    required String refId,
  }) async {
    var response =
        await appRemoteDataSource.findPatientPortalUserByRefId(refId: refId);
    if (response.success != true) {
      throw const ApiDataException("Error Occured While Sending SMS");
    }
    return response.items ?? [];
  }

  @override
  Future<HisPatientInfo> getRegPatientInfo({
    required String mrnOrPhNo,
  }) async {
    var response =
        await appRemoteDataSource.getRegPatientInfo(mrnOrPhNo: mrnOrPhNo);
    if (response.success != true) {
      throw ApiDataException(
          response.message ?? "Error Occured While Fetching");
    }
    return response.items?.first ?? HisPatientInfo();
  }

  @override
  Future<List<Paymode>> getPayModeList() async {
    var response = await appRemoteDataSource.getPayModeList();
    if (response.success != true) {
      throw const ApiDataException("Error Occured While Fetching");
    }
    return response.items ?? [];
  }
}
