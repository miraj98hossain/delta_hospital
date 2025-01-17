import 'dart:convert';
import 'dart:developer';

import 'package:delta_hospital/app/data/models/app_login_response.dart';
import 'package:delta_hospital/app/data/models/auth_response.dart';
import 'package:delta_hospital/app/data/models/generic_reponse.dart';
import 'package:delta_hospital/app/data/models/his_logout_response.dart';
import 'package:delta_hospital/app/data/models/his_patient_info_response.dart';
import 'package:delta_hospital/app/data/models/patient_relation_list_response.dart';
import 'package:delta_hospital/app/data/models/patient_portal_user_list_response.dart';
import 'package:delta_hospital/app/data/models/paymode_list_response.dart';
import 'package:delta_hospital/app/data/models/sms_response.dart';
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

  Future<AppLoginResponse> appLogin({
    required String phone,
    required String password,
  });
  Future<GenericResponse> appRegistration({
    required AppUserDetails userDetails,
  });
  Future<SmsResponse> sendSms({
    required String phone,
    required String message,
  });
  Future<PatientRelationListResponse> getPatientRelationList();
  Future<GenericResponse> savePatientPortalUser({
    required AppUserDetails userDetails,
  });
  Future<PatientPortalListResponse> finalPatientPortalUserByRefId({
    required String refId,
  });
  Future<HisPatientInfoResponse> getRegPatientInfo({
    required String mrnOrPhNo,
  });
  Future<PaymodeListResponse> getPayModeList();
}

class AppRemoteDataSourceImpl
    with DecoderServiceMixin
    implements AppRemoteDataSource {
  final AppConfig _appConfig;

  AppRemoteDataSourceImpl({
    required AppConfig appConfig,
  }) : _appConfig = appConfig;

  @override
  Future<AuthResponse> authenticate(
      {required String userName, required String password}) async {
    var headers = {
      'Authorization': 'Basic bWVkQ2xpZW50SWRQYXNzd29yZDpzZWNyZXQ='
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${_appConfig.baseUrl}auth-api/oauth/token'));
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
        Uri.parse('${_appConfig.baseUrl}auth-api/api/coreUser/user-details'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return await decodeResponse(response,
        decoder: UserDetailsResponse.fromJson);
  }

  @override
  Future<HisLogoutResponse> hisUserlogout({required String token}) async {
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request('DELETE',
        Uri.parse('${_appConfig.baseUrl}auth-api/oauth/token/logout'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return await decodeResponse(response, decoder: HisLogoutResponse.fromJson);
  }

  @override
  Future<AppLoginResponse> appLogin({
    required String phone,
    required String password,
  }) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            '${_appConfig.baseUrl}mobile-app-firebase-api/api/appAuthentication/find-by-user'));
    request.body = json.encode({"phone": phone, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return await decodeResponse(response, decoder: AppLoginResponse.fromJson);
  }

  @override
  Future<GenericResponse> appRegistration({
    required AppUserDetails userDetails,
  }) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            '${_appConfig.baseUrl}mobile-app-firebase-api/api/appAuthentication/save-user'));
    request.body = json.encode(userDetails.toMapReg());

    request.headers.addAll(headers);
    log(request.body);
    http.StreamedResponse response = await request.send();

    return await decodeResponse(response, decoder: GenericResponse.fromJson);
  }

  @override
  Future<SmsResponse> sendSms({
    required String phone,
    required String message,
  }) async {
    var request = http.Request(
      'GET',
      Uri.parse(
        'http://smpp.revesms.com:7788/sendtext?apikey=a789d21afe106ddf&secretkey=76d6d05e&callerID=BSHL&toUser=$phone&messageContent=$message',
      ),
    );

    http.StreamedResponse response = await request.send();

    return await decodeResponse<SmsResponse>(
      response,
      decoder: SmsResponse.fromJson,
    );
  }

  @override
  Future<PatientRelationListResponse> getPatientRelationList() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            '${_appConfig.baseUrl}mobile-app-firebase-api/api/patientRelation/find-all-patient-relation'));

    http.StreamedResponse response = await request.send();

    return await decodeResponse(response,
        decoder: PatientRelationListResponse.fromJson);
  }

  @override
  Future<GenericResponse> savePatientPortalUser({
    required AppUserDetails userDetails,
  }) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            '${_appConfig.baseUrl}mobile-app-firebase-api/api/patientPortalUsers/save-patientPortalUsers'));
    request.body = json.encode(userDetails.toMap());
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    return await decodeResponse(response, decoder: GenericResponse.fromJson);
  }

  @override
  Future<PatientPortalListResponse> finalPatientPortalUserByRefId({
    required String refId,
  }) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            '${_appConfig.baseUrl}mobile-app-firebase-api/api/patientPortalUsers/find-user-by-refId/$refId'));

    http.StreamedResponse response = await request.send();
    return await decodeResponse(response,
        decoder: PatientPortalListResponse.fromJson);
  }

  @override
  Future<HisPatientInfoResponse> getRegPatientInfo({
    required String mrnOrPhNo,
  }) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            '${_appConfig.baseUrl}online-appointment-api/fapi/appointment/findRegistrationByPhoneNo'));
    request.body = json.encode({"mobileNo": mrnOrPhNo});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return await decodeResponse(response,
        decoder: HisPatientInfoResponse.fromJson);
  }

  @override
  Future<PaymodeListResponse> getPayModeList() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            '${_appConfig.baseUrl}online-appointment-api/fapi/appointment/online-paymode-list'));

    http.StreamedResponse response = await request.send();

    return await decodeResponse(response,
        decoder: PaymodeListResponse.fromJson);
  }
}
