import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/doctor_schedule_response.dart';
import '../../../domain/repositories/book_apt_repository.dart';

@immutable
sealed class DoctorScheduleEvent {}

final class GetDoctorScheduleEvent extends DoctorScheduleEvent {
  final int doctorNo;
  final String scheduleDate;
  GetDoctorScheduleEvent({
    required this.doctorNo,
    required this.scheduleDate,
  });
}

@immutable
sealed class DoctorScheduleState {}

final class DoctorScheduleInitial extends DoctorScheduleState {}

final class DoctorScheduleLoading extends DoctorScheduleState {}

final class DoctorScheduleSuccess extends DoctorScheduleState {
  final List<DoctorSchedule> doctorScheduleList;

  DoctorScheduleSuccess({required this.doctorScheduleList});
}

final class DoctorScheduleError extends DoctorScheduleState {
  final Object error;

  DoctorScheduleError({required this.error});
}

class DoctorScheduleBloc
    extends Bloc<DoctorScheduleEvent, DoctorScheduleState> {
  final BookAptRepository _bookAptRepository;
  DoctorScheduleBloc(this._bookAptRepository) : super(DoctorScheduleInitial()) {
    on<GetDoctorScheduleEvent>((event, emit) async {
      emit(DoctorScheduleLoading());
      try {
        var response = await _bookAptRepository.getDoctorSchedule(
          doctorNo: event.doctorNo,
          scheduleDate: event.scheduleDate,
        );
        emit(DoctorScheduleSuccess(doctorScheduleList: response));
      } catch (e) {
        emit(DoctorScheduleError(error: e));
      }
    });
  }
}
