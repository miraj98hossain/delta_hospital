import 'package:delta_hospital/features/doctor_portal/data/models/doctor_consultaion_gridlist_response.dart';
import 'package:delta_hospital/features/doctor_portal/data/models/doctor_shift_list_response.dart';

abstract class DocPortalRepository {
  Future<List<Shift>> getDoctorShiftByAccessToken();
  Future<List<Consultation>> getDoctorConsultationList({
    required int doctorNo,
    required String fromDate,
    required int shiftdtlNo,
  });
}
