import 'package:delta_hospital/app/data/models/his_patient_info_response.dart';
import 'package:delta_hospital/features/patient_portal/domain/repositories/pat_portal_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class HisPatInfoByTokenEvent {}

final class HisPatInfoByTokenGet extends HisPatInfoByTokenEvent {}

@immutable
sealed class HisPatInfoByTokenState {}

final class HisPatInfoByTokenInitial extends HisPatInfoByTokenState {}

final class HisPatInfoByTokenLoading extends HisPatInfoByTokenState {}

final class HisPatInfoByTokenSuccess extends HisPatInfoByTokenState {
  final HisPatientInfo hisPatientInfo;

  HisPatInfoByTokenSuccess({required this.hisPatientInfo});
}

final class HisPatInfoByTokenError extends HisPatInfoByTokenState {
  final Object error;

  HisPatInfoByTokenError({required this.error});
}

class HisPatInfoByTokenBloc
    extends Bloc<HisPatInfoByTokenEvent, HisPatInfoByTokenState> {
  final PatPortalRepository _repository;
  HisPatInfoByTokenBloc(this._repository) : super(HisPatInfoByTokenInitial()) {
    on<HisPatInfoByTokenGet>((event, emit) async {
      emit(HisPatInfoByTokenLoading());
      try {
        var response = await _repository.getPatientInfoByAccessToken();
        emit(HisPatInfoByTokenSuccess(hisPatientInfo: response));
      } catch (e) {
        emit(HisPatInfoByTokenError(error: e));
      }
    });
  }
}
