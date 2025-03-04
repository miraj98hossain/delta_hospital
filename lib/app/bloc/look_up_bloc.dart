import 'package:delta_hospital/data/models/lookup_response.dart';

import 'package:delta_hospital/domain/repositories/hospital_info_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class LookUpEvent {}

final class LookUpGet extends LookUpEvent {
  final int lookupNo;
  LookUpGet({required this.lookupNo});
}

@immutable
sealed class LookUpState {}

final class LookUpInitial extends LookUpState {}

final class LookUpLoading extends LookUpState {}

final class LookUpSuccess extends LookUpState {
  final List<LookUpDetails> lookUpDetails;
  LookUpSuccess({required this.lookUpDetails});
}

final class LookUpError extends LookUpState {
  final Object error;
  LookUpError({required this.error});
}

class LookUpBloc extends Bloc<LookUpEvent, LookUpState> {
  final HospitalInfoRepository _hospitalInfoRepository;
  LookUpBloc(this._hospitalInfoRepository) : super(LookUpInitial()) {
    on<LookUpGet>((event, emit) async {
      emit(LookUpLoading());
      try {
        var response = await _hospitalInfoRepository.getLookUpByNo(
            lookupNo: event.lookupNo);
        emit(LookUpSuccess(lookUpDetails: response));
      } catch (e) {
        emit(LookUpError(error: e));
      }
    });
  }
}
