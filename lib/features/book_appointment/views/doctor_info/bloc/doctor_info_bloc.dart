import 'package:delta_hospital/features/book_appointment/data/models/doctor_info_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/book_apt_repository.dart';

@immutable
sealed class DoctorInfoEvent {}

final class GetDoctorInfoEvent extends DoctorInfoEvent {
  final int doctorNo;

  GetDoctorInfoEvent({
    required this.doctorNo,
  });
}

@immutable
sealed class DoctorInfoState {}

final class DoctorInfoInitial extends DoctorInfoState {}

final class DoctorInfoLoading extends DoctorInfoState {}

final class DoctorInfoSuccess extends DoctorInfoState {
  final DoctorInfo doctorInfo;

  DoctorInfoSuccess({required this.doctorInfo});
}

final class DoctorInfoError extends DoctorInfoState {
  final Object error;

  DoctorInfoError({required this.error});
}

class DoctorInfoBloc extends Bloc<DoctorInfoEvent, DoctorInfoState> {
  final BookAptRepository _bookAptRepository;
  DoctorInfoBloc(this._bookAptRepository) : super(DoctorInfoInitial()) {
    on<GetDoctorInfoEvent>((event, emit) async {
      emit(DoctorInfoLoading());
      try {
        var response = await _bookAptRepository.getDoctorInfo(
          doctorNo: event.doctorNo,
        );
        emit(DoctorInfoSuccess(doctorInfo: response));
      } catch (e) {
        emit(DoctorInfoError(error: e));
      }
    });
  }
}
