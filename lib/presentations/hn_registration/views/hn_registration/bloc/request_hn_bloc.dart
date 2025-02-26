import 'package:delta_hospital/data/models/hn_registration.dart';
import 'package:delta_hospital/data/models/hn_registration_response.dart';

import 'package:delta_hospital/domain/repositories/hn_reg_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class RequestHnEvent {}

final class RequestHn extends RequestHnEvent {
  final HnRegistration hnRegistration;

  RequestHn({
    required this.hnRegistration,
  });
}

@immutable
sealed class RequestHnState {}

final class RequestHnInitial extends RequestHnState {}

final class RequestHnSuccess extends RequestHnState {
  final HnInfo hnInfo;
  RequestHnSuccess({required this.hnInfo});
}

final class RequestHnError extends RequestHnState {
  final Object error;

  RequestHnError({required this.error});
}

final class RequestHnLoading extends RequestHnState {}

class RequestHnBloc extends Bloc<RequestHnEvent, RequestHnState> {
  final HnRegRepository hnRegRepository;
  RequestHnBloc(this.hnRegRepository) : super(RequestHnInitial()) {
    on<RequestHn>((event, emit) async {
      emit(RequestHnLoading());
      try {
        var response = await hnRegRepository.registerHn(
            hnRegistration: event.hnRegistration);
        emit(RequestHnSuccess(hnInfo: response));
      } catch (e) {
        emit(RequestHnError(error: e));
      }
    });
  }
}
