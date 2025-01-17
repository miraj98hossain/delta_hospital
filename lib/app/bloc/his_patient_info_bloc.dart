import 'package:delta_hospital/app/data/models/his_patient_info_response.dart';
import 'package:delta_hospital/app/domain/repositories/app_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class HisPatientInfoEvent {}

final class HisPatientInfoGet extends HisPatientInfoEvent {
  final String mrnOrPhNo;

  HisPatientInfoGet({required this.mrnOrPhNo});
}

@immutable
sealed class HisPatientInfoState {}

final class HisPatientInfoInitial extends HisPatientInfoState {}

final class HisPatientInfoLoading extends HisPatientInfoState {}

final class HisPatientInfoSuccess extends HisPatientInfoState {
  final HisPatientInfo patientInfo;
  HisPatientInfoSuccess({required this.patientInfo});
}

final class HisPatientInfoError extends HisPatientInfoState {
  final Object error;
  HisPatientInfoError({required this.error});
}

class HisPatientInfoBloc
    extends Bloc<HisPatientInfoEvent, HisPatientInfoState> {
  final AppRepository _appRepository;
  HisPatientInfoBloc(this._appRepository) : super(HisPatientInfoInitial()) {
    on<HisPatientInfoGet>((event, emit) async {
      emit(HisPatientInfoLoading());
      try {
        var response =
            await _appRepository.getRegPatientInfo(mrnOrPhNo: event.mrnOrPhNo);
        emit(HisPatientInfoSuccess(patientInfo: response));
      } catch (e) {
        emit(HisPatientInfoError(error: e));
      }
    });
  }
}
