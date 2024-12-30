import 'package:delta_hospital/app/data/models/his_patient_info_response.dart';
import 'package:delta_hospital/features/patient_portal/domain/repositories/pat_portal_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class HisPatientInfoEvent {}

final class GetHisPatientInfoEvent extends HisPatientInfoEvent {}

@immutable
sealed class HisPatientInfoState {}

final class HisPatientInfoInitial extends HisPatientInfoState {}

final class HisPatientInfoLoading extends HisPatientInfoState {}

final class HisPatientInfoSuccess extends HisPatientInfoState {
  final HisPatientInfo hisPatientInfo;

  HisPatientInfoSuccess({required this.hisPatientInfo});
}

final class HisPatientInfoError extends HisPatientInfoState {
  final Object error;

  HisPatientInfoError({required this.error});
}

class HisPatientInfoBloc
    extends Bloc<HisPatientInfoEvent, HisPatientInfoState> {
  final PatPortalRepository _repository;
  HisPatientInfoBloc(this._repository) : super(HisPatientInfoInitial()) {
    on<GetHisPatientInfoEvent>((event, emit) async {
      emit(HisPatientInfoLoading());
      try {
        var response = await _repository.getPatientInfoByAccessToken();
        emit(HisPatientInfoSuccess(hisPatientInfo: response));
      } catch (e) {
        emit(HisPatientInfoError(error: e));
      }
    });
  }
}
