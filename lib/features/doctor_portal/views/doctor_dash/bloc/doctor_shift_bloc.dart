import 'package:delta_hospital/features/doctor_portal/data/models/doctor_shift_list_response.dart';
import 'package:delta_hospital/features/doctor_portal/domain/repositories/doc_portal_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class DoctorShiftEvent {}

final class GetDoctorShiftEvent extends DoctorShiftEvent {}

@immutable
sealed class DoctorShiftState {}

final class DoctorShiftInitial extends DoctorShiftState {}

final class DoctorShiftLaoding extends DoctorShiftState {}

final class DoctorShiftSuccess extends DoctorShiftState {
  final List<Shift> doctorShiftList;
  DoctorShiftSuccess({required this.doctorShiftList});
}

final class DoctorShiftError extends DoctorShiftState {
  final Object error;
  DoctorShiftError({required this.error});
}

class DoctorShiftBloc extends Bloc<DoctorShiftEvent, DoctorShiftState> {
  final DocPortalRepository _docPortalRepository;
  DoctorShiftBloc(this._docPortalRepository) : super(DoctorShiftInitial()) {
    on<GetDoctorShiftEvent>((event, emit) async {
      emit(DoctorShiftLaoding());
      try {
        var response = await _docPortalRepository.getDoctorShiftByAccessToken();
        emit(DoctorShiftSuccess(doctorShiftList: response));
      } catch (e) {
        emit(DoctorShiftError(error: e));
      }
    });
  }
}
