import 'dart:typed_data';

import 'package:delta_hospital/app/data/models/app_login_response.dart';
import 'package:delta_hospital/app/data/models/his_patient_info_response.dart';
import 'package:delta_hospital/app/data/models/patient_relation_list_response.dart';
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
  Future<HisPatientInfo> getRegPatientInfo({
    required String mrnOrPhNo,
  });
  Future<HisPatientInfo> findRegAndCreateUser({
    required String mrn,
  });
  Future<List<PatientRelation>> getPatientRelationList();
  Future<void> savePatientPortalUser({
    required AppUserDetails userDetails,
  });
  Future<Uint8List> getPrescriptionPdf({
    required int prescriptionId,
    required String? token,
  });
}
