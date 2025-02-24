import 'package:delta_hospital/data/models/doctor_admitted_patient_list_response.dart';
import 'package:delta_hospital/data/models/doctor_consultaion_gridlist_response.dart';
import 'package:delta_hospital/data/models/doctor_shift_list_response.dart';

abstract class DocPortalRepository {
  Future<List<Shift>> getDoctorShiftByAccessToken();
  Future<List<Consultation>> getDoctorConsultationList({
    required int doctorNo,
    required String fromDate,
    required int shiftdtlNo,
  });
  Future<List<AdmittedPatient>> getDoctorAdmittedPatientList({
    required int doctorNo,
  });
}
