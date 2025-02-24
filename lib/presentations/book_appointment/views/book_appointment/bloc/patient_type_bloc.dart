import 'package:delta_hospital/data/models/patient_type_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/repositories/book_apt_repository.dart';

@immutable
sealed class PatientTypeEvent {}

final class GetPatientTypeEvent extends PatientTypeEvent {
  final int doctorNo;

  GetPatientTypeEvent({required this.doctorNo});
}

@immutable
sealed class PatientTypeState {}

final class PatientTypeInitial extends PatientTypeState {}

final class PatientTypeLoading extends PatientTypeState {}

final class PatientTypeSuccess extends PatientTypeState {
  final List<PatientType> patTypeList;

  PatientTypeSuccess({required this.patTypeList});
}

final class PatientTypeError extends PatientTypeState {
  final Object error;

  PatientTypeError({required this.error});
}

class PatientTypeBloc extends Bloc<PatientTypeEvent, PatientTypeState> {
  final BookAptRepository _bookAptRepository;
  PatientTypeBloc(this._bookAptRepository) : super(PatientTypeInitial()) {
    on<GetPatientTypeEvent>((event, emit) async {
      emit(PatientTypeLoading());
      try {
        var response =
            await _bookAptRepository.getPatientType(doctorNo: event.doctorNo);
        emit(PatientTypeSuccess(patTypeList: response));
      } catch (e) {
        emit(PatientTypeError(error: e));
      }
    });
  }
}
