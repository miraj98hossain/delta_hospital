import 'package:delta_hospital/presentations/patient_portal/data/models/patient_prescription_gridlist_response.dart';
import 'package:delta_hospital/presentations/patient_portal/domain/repositories/pat_portal_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class PrescriptionEvent {}

final class GetPrescriptionEvent extends PrescriptionEvent {
  final int start;
  final int length;

  GetPrescriptionEvent({this.start = 0, this.length = 10});
}

@immutable
sealed class PrescriptionState {}

final class PrescriptionInitial extends PrescriptionState {}

final class PrescriptionLoading extends PrescriptionState {}

final class PrescriptionSuccess extends PrescriptionState {
  final PrescriptionGridList prescriptionGridList;

  PrescriptionSuccess({required this.prescriptionGridList});
}

final class PrescriptionError extends PrescriptionState {
  final Object error;

  PrescriptionError({required this.error});
}

class PrescriptionBloc extends Bloc<PrescriptionEvent, PrescriptionState> {
  final PatPortalRepository _repository;
  PrescriptionBloc(this._repository) : super(PrescriptionInitial()) {
    on<GetPrescriptionEvent>((event, emit) async {
      emit(PrescriptionLoading());
      try {
        var response = await _repository.getPrescriptionByAccessToken(
            start: event.start, length: event.length);
        emit(PrescriptionSuccess(prescriptionGridList: response));
      } catch (e) {
        emit(PrescriptionError(error: e));
      }
    });
  }
}
