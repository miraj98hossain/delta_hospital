import 'package:delta_hospital/features/management/data/models/opd_ipd_patient_report_response.dart';

abstract class MngPortalRepository {
  Future<List<PatientReport>> findOpdIpdPatientReport({
    required String fromDate,
    required String toDate,
  });
}
