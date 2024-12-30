import 'package:delta_hospital/app/data/models/his_patient_info_response.dart';
import 'package:delta_hospital/features/patient_portal/data/models/patient_prescription_gridlist_response.dart';

abstract class PatPortalRepository {
  Future<HisPatientInfo> getPatientInfoByAccessToken();
  Future<PrescriptionGridList> getPrescriptionByAccessToken({
    required int start,
    required int length,
  });
}
