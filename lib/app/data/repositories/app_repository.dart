import 'package:delta_hospital/app/data/models/auth_response.dart';
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

  Future<void> saveHisSessionExpiryTime({
    required DateTime dateTime,
  });
  Future<DateTime> getHisSessionExpiryTime();
  Future<void> clearHisSessionExpiryTime();
}
