import 'package:delta_hospital/domain/repositories/hn_reg_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class HnRegFeeEvent {}

final class HnRegFeeGet extends HnRegFeeEvent {}

@immutable
class HnRegFeeState {
  final num regFee;

  const HnRegFeeState({required this.regFee});
}

class HnRegFeeBloc extends Bloc<HnRegFeeEvent, HnRegFeeState> {
  final HnRegRepository hnRegRepository;
  HnRegFeeBloc(this.hnRegRepository) : super(const HnRegFeeState(regFee: 0)) {
    on<HnRegFeeGet>((event, emit) async {
      try {
        var response = await hnRegRepository.getHnRegistrationFee();

        emit(HnRegFeeState(regFee: response.salesPrice ?? 0));
      } catch (e) {
        emit(const HnRegFeeState(regFee: 0));
      }
    });
  }
}
