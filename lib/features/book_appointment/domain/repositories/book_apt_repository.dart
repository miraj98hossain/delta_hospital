import 'package:delta_hospital/features/book_appointment/data/models/online_department_list.dart';

abstract class BookAptRepository {
  Future<List<Department>> getOnlineDepartmentList();
}
