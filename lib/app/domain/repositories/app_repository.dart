import 'package:delta_hospital/app/data/models/app_login_response.dart';
import 'package:delta_hospital/app/data/models/auth_response.dart';
import 'package:delta_hospital/app/data/models/his_patient_info_response.dart';
import 'package:delta_hospital/app/data/models/patient_portal_user_list_response.dart';
import 'package:delta_hospital/app/data/models/paymode_list_response.dart';
import 'package:delta_hospital/app/data/models/user_details_response.dart';

abstract class AppRepository {
  Future<void> saveAuthResponse({
    required AuthResponse response,
  });

  Future<AuthResponse> getAuthResponse();

  Future<void> clearAuthResponse();
  Future<AuthResponse> authenticate({
    required String userName,
    required String password,
  });
  Future<void> hisUserlogout();
  Future<UserDetails> getUserDetails();

  Future<void> saveHisUser({
    required UserDetails userDetails,
  });
  Future<UserDetails> getHisUser();
  Future<void> clearHisUser();

  Future<void> saveAppUser({
    required AppUserDetails userDetails,
  });
  Future<AppUserDetails> getAppUser();
  Future<void> clearAppUser();

  Future<void> saveHisSessionExpiryTime({
    required DateTime dateTime,
  });
  Future<DateTime> getHisSessionExpiryTime();
  Future<void> clearHisSessionExpiryTime();
  Future<AppUserDetails> appLogin({
    required String phone,
    required String password,
  });
  Future<void> applogout();
  Future<void> appRegistration({required AppUserDetails userDetails});
  Future<void> sendSms({
    required String phone,
    required String message,
  });
  Future<void> savePatientPortalUser({
    required AppUserDetails userDetails,
  });
  Future<List<PatientPortalUser>> finalPatientPortalUserByRefId({
    required String refId,
  });
  Future<HisPatientInfo> getRegPatientInfo({
    required String mrnOrPhNo,
  });
  Future<List<Paymode>> getPayModeList();
}
