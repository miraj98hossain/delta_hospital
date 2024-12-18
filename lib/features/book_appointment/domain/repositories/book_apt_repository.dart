import 'package:delta_hospital/features/book_appointment/data/models/doctor_grid_list_response.dart';
import 'package:delta_hospital/features/book_appointment/data/models/online_department_list.dart';
import 'package:delta_hospital/features/book_appointment/data/models/online_sepcialization_list_response.dart';

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
}
