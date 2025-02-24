import 'package:delta_hospital/presentations/book_appointment/data/models/online_department_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/book_apt_repository.dart';

@immutable
sealed class DepartmentEvent {}

final class GetDepartmentEvent extends DepartmentEvent {}

@immutable
sealed class DepartmentState {}

final class DepartmentInitial extends DepartmentState {}

final class DepartmentLoading extends DepartmentState {}

final class DepartmentSuccess extends DepartmentState {
  final List<Department> deptList;

  DepartmentSuccess({required this.deptList});
}

final class DepartmentError extends DepartmentState {
  final Object error;

  DepartmentError({required this.error});
}

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  final BookAptRepository _bookAptRepository;
  DepartmentBloc(this._bookAptRepository) : super(DepartmentInitial()) {
    on<GetDepartmentEvent>((event, emit) async {
      emit(DepartmentLoading());
      try {
        var response = await _bookAptRepository.getOnlineDepartmentList();
        emit(DepartmentSuccess(deptList: response));
      } catch (e) {
        emit(DepartmentError(error: e));
      }
    });
  }
}
