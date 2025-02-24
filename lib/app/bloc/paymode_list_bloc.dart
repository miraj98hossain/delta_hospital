import 'package:delta_hospital/data/models/paymode_list_response.dart';
import 'package:delta_hospital/domain/repositories/app_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class PaymodeListEvent {}

final class PaymodeListGet extends PaymodeListEvent {
  PaymodeListGet();
}

@immutable
sealed class PaymodeListState {}

final class PaymodeListInitial extends PaymodeListState {}

final class PaymodeListLoading extends PaymodeListState {}

final class PaymodeListSuccess extends PaymodeListState {
  final List<Paymode> paymodeList;
  PaymodeListSuccess({required this.paymodeList});
}

final class PaymodeListError extends PaymodeListState {
  final Object error;
  PaymodeListError({required this.error});
}

class PaymodeListBloc extends Bloc<PaymodeListEvent, PaymodeListState> {
  final AppRepository _appRepository;
  PaymodeListBloc(this._appRepository) : super(PaymodeListInitial()) {
    on<PaymodeListGet>((event, emit) async {
      emit(PaymodeListLoading());
      try {
        var response = await _appRepository.getPayModeList();
        emit(PaymodeListSuccess(paymodeList: response));
      } catch (e) {
        emit(PaymodeListError(error: e));
      }
    });
  }
}
