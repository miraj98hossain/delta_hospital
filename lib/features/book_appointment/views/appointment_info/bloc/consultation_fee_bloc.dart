import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/book_apt_repository.dart';

@immutable
sealed class ConsultationFeeEvent {}

final class ConsultationFeeGet extends ConsultationFeeEvent {
  final int doctorNo;
  final String patTypeNo;
  final String? conTypeNo;

  ConsultationFeeGet({
    required this.doctorNo,
    required this.patTypeNo,
    required this.conTypeNo,
  });
}

@immutable
sealed class ConsultationFeeState {}

final class ConsultationFeeInitial extends ConsultationFeeState {}

final class ConsultationFeeLoading extends ConsultationFeeState {}

final class ConsultationFeeSuccess extends ConsultationFeeState {
  final int fee;

  ConsultationFeeSuccess({required this.fee});
}

final class ConsultationFeeError extends ConsultationFeeState {
  final Object error;

  ConsultationFeeError({required this.error});
}

class ConsultationFeeBloc
    extends Bloc<ConsultationFeeEvent, ConsultationFeeState> {
  final BookAptRepository _bookAptRepository;
  ConsultationFeeBloc(this._bookAptRepository)
      : super(ConsultationFeeInitial()) {
    on<ConsultationFeeGet>((event, emit) async {
      emit(ConsultationFeeLoading());
      try {
        var response = await _bookAptRepository.getDoctorConsultationFee(
          doctorNo: event.doctorNo,
          patTypeNo: event.patTypeNo,
          conTypeNo: event.conTypeNo,
        );
        emit(ConsultationFeeSuccess(fee: response));
      } catch (e) {
        emit(ConsultationFeeError(error: e));
      }
    });
  }
}
