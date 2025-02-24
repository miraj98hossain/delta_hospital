import 'package:delta_hospital/data/models/appointment.dart';
import 'package:delta_hospital/data/models/appointment_booking_response.dart';
import 'package:delta_hospital/data/models/available_slot_response.dart';
import 'package:delta_hospital/data/models/consultation_type_response.dart';
import 'package:delta_hospital/data/models/doctor_grid_list_response.dart';
import 'package:delta_hospital/data/models/doctor_info_response.dart';
import 'package:delta_hospital/data/models/doctor_schedule_response.dart';
import 'package:delta_hospital/data/models/online_department_list.dart';
import 'package:delta_hospital/data/models/online_sepcialization_list_response.dart';
import 'package:delta_hospital/data/models/patient_type_response.dart';
import 'package:delta_hospital/data/models/slot_status_response.dart';

abstract class BookAptRepository {
  Future<List<Department>> getOnlineDepartmentList();
  Future<List<Specialization>> getOnlineSpecializationtList();
  Future<DoctorGridList> getDoctorGridList({
    int start = 0,
    int length = 10,
    int? departmentNo,
    List<int>? specializationNos,
    String searchValue = '',
  });
  Future<List<PatientType>> getPatientType({
    required int doctorNo,
  });
  Future<List<ConsultationType>> getConsultationType({
    required int doctorNo,
    required String patTypeNo,
    int? hospitalNumber,
    required String appointmentDate,
  });
  Future<List<Slot>> getAvailableSlot({
    required int doctorNo,
    required String appointDate,
  });
  Future<SlotStatus> checkSlotStatus({
    required int slotNo,
  });
  Future<DoctorInfo> getDoctorInfo({
    required int doctorNo,
  });
  Future<List<DoctorSchedule>> getDoctorSchedule({
    required int doctorNo,
    required String scheduleDate,
  });
  Future<int> getDoctorConsultationFee({
    required int doctorNo,
    required String patTypeNo,
    required String? conTypeNo,
  });
  Future<AppointmentBookingStatus> bookAppointment({
    required Appointment appointment,
  });
}
