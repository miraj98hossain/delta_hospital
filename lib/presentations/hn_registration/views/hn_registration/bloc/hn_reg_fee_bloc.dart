import 'package:delta_hospital/data/models/hn_registration_fee_response.dart';
import 'package:delta_hospital/domain/repositories/hn_reg_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class HnRegFeeEvent {}

final class HnRegFeeGet extends HnRegFeeEvent {}

@immutable
sealed class HnRegFeeState {}

final class HnRegFeeInitial extends HnRegFeeState {}

final class HnRegFeeSuccess extends HnRegFeeState {
  final HnRegistrationFee hnRegistrationFee;
  HnRegFeeSuccess({required this.hnRegistrationFee});
}

final class HnRegFeeError extends HnRegFeeState {
  final Object error;

  HnRegFeeError({required this.error});
}

final class HnRegFeeLoading extends HnRegFeeState {}

class HnRegFeeBloc extends Bloc<HnRegFeeEvent, HnRegFeeState> {
  final HnRegRepository hnRegRepository;
  HnRegFeeBloc(this.hnRegRepository) : super(HnRegFeeInitial()) {
    on<HnRegFeeGet>((event, emit) async {
      emit(HnRegFeeLoading());
      try {
        var response = await hnRegRepository.getHnRegistrationFee();

        emit(HnRegFeeSuccess(hnRegistrationFee: response));
      } catch (e) {
        emit(HnRegFeeError(error: e));
      }
    });
  }
}
