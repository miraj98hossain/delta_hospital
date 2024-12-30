import 'package:delta_hospital/app/data/models/his_patient_info_response.dart';

abstract class PatPortalRepository {
  Future<HisPatientInfo> getPatientInfoByAccessToken();
}
