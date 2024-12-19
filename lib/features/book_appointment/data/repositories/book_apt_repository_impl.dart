import 'package:delta_hospital/app/data/data_sources/local_data_source.dart';
import 'package:delta_hospital/core/exceptions/api_exceptions.dart';
import 'package:delta_hospital/features/book_appointment/data/data_sources/book_apt_remote_data_source.dart';
import 'package:delta_hospital/features/book_appointment/data/models/consultation_type_response.dart';
import 'package:delta_hospital/features/book_appointment/data/models/doctor_grid_list_response.dart';
import 'package:delta_hospital/features/book_appointment/data/models/online_department_list.dart';
import 'package:delta_hospital/features/book_appointment/data/models/online_sepcialization_list_response.dart';
import 'package:delta_hospital/features/book_appointment/data/models/patient_type_response.dart';
import 'package:delta_hospital/features/book_appointment/domain/repositories/book_apt_repository.dart';

class BookAptRepositoryImpl implements BookAptRepository {
  final BookAptRemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  BookAptRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<List<Department>> getOnlineDepartmentList() async {
    var response = await remoteDataSource.getOnlineDepartmentList();
    if (response.success != true) {
      throw ApiDataException(response.message!);
    }
    return response.items ?? [];
  }

  @override
  Future<List<Specialization>> getOnlineSpecializationtList() async {
    var response = await remoteDataSource.getOnlineSpecializationtList();
    if (response.success != true) {
      throw ApiDataException(response.message!);
    }
    return response.items ?? [];
  }

  @override
  Future<DoctorGridList> getDoctorGridList(
      {int start = 0,
      int length = 10,
      int? departmentNo,
      List<int>? specializationNos,
      String searchValue = ''}) async {
    var response = await remoteDataSource.getDoctorGridList(
        start: start,
        length: length,
        departmentNo: departmentNo,
        specializationNos: specializationNos,
        searchValue: searchValue);
    if (response.success != true) {
      throw ApiDataException(response.message!);
    }
    return response.obj ?? DoctorGridList();
  }

  @override
  Future<List<PatientType>> getPatientType({required int doctorNo}) async {
    var response = await remoteDataSource.getPatientType(doctorNo: doctorNo);
    if (response.success != true) {
      throw ApiDataException(response.message!);
    }
    return response.items ?? [];
  }

  @override
  Future<List<ConsultationType>> getConsultationType({
    required int doctorNo,
    required String patTypeNo,
    int? hospitalNumber,
    required String appointmentDate,
  }) async {
    var response = await remoteDataSource.getConsultationType(
      doctorNo: doctorNo,
      patTypeNo: patTypeNo,
      hospitalNumber: hospitalNumber,
      appointmentDate: appointmentDate,
    );
    if (response.success != true) {
      throw ApiDataException(response.message!);
    }
    return response.items ?? [];
  }
}
