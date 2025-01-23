import 'package:delta_hospital/features/management/data/models/opd_ipd_patient_report_response.dart';
import 'package:delta_hospital/features/management/domain/repositories/mng_portal_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class PatientReportEvent {}

final class PatientReportGet extends PatientReportEvent {
  final String fromDate;
  final String toDate;

  PatientReportGet({required this.fromDate, required this.toDate});
}

@immutable
sealed class PatientReportState {}

final class PatientReportInitial extends PatientReportState {}

final class PatientReportLoading extends PatientReportState {}

final class PatientReportSuccess extends PatientReportState {
  final List<PatientReport> patientReportList;

  PatientReportSuccess({required this.patientReportList});
}

final class PatientReportError extends PatientReportState {
  final Object error;

  PatientReportError({required this.error});
}

class PatientReportBloc extends Bloc<PatientReportEvent, PatientReportState> {
  final MngPortalRepository _mngRepository;
  PatientReportBloc(this._mngRepository) : super(PatientReportInitial()) {
    on<PatientReportGet>((event, emit) async {
      emit(PatientReportLoading());
      try {
        var response = await _mngRepository.findOpdIpdPatientReport(
          fromDate: event.fromDate,
          toDate: event.toDate,
        );
        emit(PatientReportSuccess(patientReportList: response));
      } catch (e) {
        emit(PatientReportError(error: e));
      }
    });
  }
}
