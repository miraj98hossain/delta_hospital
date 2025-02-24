import 'package:delta_hospital/data/models/doctor_admitted_patient_list_response.dart';
import 'package:delta_hospital/domain/repositories/doc_portal_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class DoctorAdmittedPatientEvent {}

final class GetDoctorAdmittedPatientEvent extends DoctorAdmittedPatientEvent {
  final int doctorNo;

  GetDoctorAdmittedPatientEvent({
    required this.doctorNo,
  });
}

@immutable
sealed class DoctorAdmittedPatientState {}

final class DoctorAdmittedPatientInitial extends DoctorAdmittedPatientState {}

final class DoctorAdmittedPatientLaoding extends DoctorAdmittedPatientState {}

final class DoctorAdmittedPatientSuccess extends DoctorAdmittedPatientState {
  final List<AdmittedPatient> doctorAdmittedPatientList;
  DoctorAdmittedPatientSuccess({required this.doctorAdmittedPatientList});
}

final class DoctorAdmittedPatientError extends DoctorAdmittedPatientState {
  final Object error;
  DoctorAdmittedPatientError({required this.error});
}

class DoctorAdmittedPatientBloc
    extends Bloc<DoctorAdmittedPatientEvent, DoctorAdmittedPatientState> {
  final DocPortalRepository _docPortalRepository;
  DoctorAdmittedPatientBloc(this._docPortalRepository)
      : super(DoctorAdmittedPatientInitial()) {
    on<GetDoctorAdmittedPatientEvent>((event, emit) async {
      emit(DoctorAdmittedPatientLaoding());
      try {
        var response = await _docPortalRepository.getDoctorAdmittedPatientList(
          doctorNo: event.doctorNo,
        );
        emit(DoctorAdmittedPatientSuccess(doctorAdmittedPatientList: response));
      } catch (e) {
        emit(DoctorAdmittedPatientError(error: e));
      }
    });
  }
}
