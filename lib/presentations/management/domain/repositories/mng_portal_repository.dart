import 'package:delta_hospital/presentations/management/data/models/financial_dash_report_response.dart';
import 'package:delta_hospital/presentations/management/data/models/opd_ipd_patient_report_response.dart';

abstract class MngPortalRepository {
  Future<List<PatientReport>> findOpdIpdPatientReport({
    required String fromDate,
    required String toDate,
  });
  Future<List<FinancialReport>> findFinancialDashReport({
    required String fromDate,
    required String toDate,
  });
}
