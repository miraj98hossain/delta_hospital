import 'package:delta_hospital/app/data/models/his_patient_info_response.dart';
import 'package:delta_hospital/features/patient_portal/data/models/patient_notes_gridlist_response.dart';
import 'package:delta_hospital/features/patient_portal/data/models/patient_prescription_gridlist_response.dart';
import 'package:delta_hospital/features/patient_portal/data/models/patient_report_gridlist_response.dart';

abstract class PatPortalRepository {
  Future<HisPatientInfo> getPatientInfoByAccessToken();
  Future<PrescriptionGridList> getPrescriptionByAccessToken({
    required int start,
    required int length,
  });
  Future<ReportGridList> getReportByAccessToken({
    required int start,
    required int length,
  });
  Future<void> addNoteByAccessToken({
    required String title,
    required String description,
  });
  Future<NotesGridList> getNotesByAccessToken({
    required int start,
    required int length,
  });
}
