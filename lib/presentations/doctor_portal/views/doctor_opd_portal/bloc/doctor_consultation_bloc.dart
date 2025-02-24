import 'package:delta_hospital/presentations/doctor_portal/data/models/doctor_consultaion_gridlist_response.dart';
import 'package:delta_hospital/presentations/doctor_portal/domain/repositories/doc_portal_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class DoctorConsultationEvent {}

final class GetDoctorConsultationEvent extends DoctorConsultationEvent {
  final int doctorNo;
  final String fromDate;
  final int shiftdtlNo;
  GetDoctorConsultationEvent({
    required this.doctorNo,
    required this.fromDate,
    required this.shiftdtlNo,
  });
}

@immutable
sealed class DoctorConsultationState {}

final class DoctorConsultationInitial extends DoctorConsultationState {}

final class DoctorConsultationLaoding extends DoctorConsultationState {}

final class DoctorConsultationSuccess extends DoctorConsultationState {
  final List<Consultation> doctorConsultationList;
  DoctorConsultationSuccess({required this.doctorConsultationList});
}

final class DoctorConsultationError extends DoctorConsultationState {
  final Object error;
  DoctorConsultationError({required this.error});
}

class DoctorConsultationBloc
    extends Bloc<DoctorConsultationEvent, DoctorConsultationState> {
  final DocPortalRepository _docPortalRepository;
  DoctorConsultationBloc(this._docPortalRepository)
      : super(DoctorConsultationInitial()) {
    on<GetDoctorConsultationEvent>((event, emit) async {
      emit(DoctorConsultationLaoding());
      try {
        var response = await _docPortalRepository.getDoctorConsultationList(
            doctorNo: event.doctorNo,
            fromDate: event.fromDate,
            shiftdtlNo: event.shiftdtlNo);
        emit(DoctorConsultationSuccess(doctorConsultationList: response));
      } catch (e) {
        emit(DoctorConsultationError(error: e));
      }
    });
  }
}
