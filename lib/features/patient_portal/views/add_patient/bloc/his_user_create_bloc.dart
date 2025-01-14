import 'package:delta_hospital/app/data/models/his_patient_info_response.dart';
import 'package:delta_hospital/features/patient_portal/domain/repositories/pat_portal_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class HisUserCreateEvent {}

final class HisUserCreate extends HisUserCreateEvent {
  final String mrn;

  HisUserCreate({required this.mrn});
}

@immutable
sealed class HisUserCreateState {}

final class HisUserCreateInitial extends HisUserCreateState {}

final class HisUserCreateSuccess extends HisUserCreateState {
  final HisPatientInfo hisPatientInfo;
  HisUserCreateSuccess({required this.hisPatientInfo});
}

final class HisUserCreateError extends HisUserCreateState {
  final Object error;

  HisUserCreateError({required this.error});
}

final class HisUserCreateLoading extends HisUserCreateState {}

class HisUserCreateBloc extends Bloc<HisUserCreateEvent, HisUserCreateState> {
  final PatPortalRepository patPortalRepository;
  HisUserCreateBloc(this.patPortalRepository) : super(HisUserCreateInitial()) {
    on<HisUserCreate>((event, emit) async {
      emit(HisUserCreateLoading());
      try {
        var response =
            await patPortalRepository.findRegAndCreateUser(mrn: event.mrn);
        emit(HisUserCreateSuccess(hisPatientInfo: response));
      } catch (e) {
        emit(HisUserCreateError(error: e));
      }
    });
  }
}
