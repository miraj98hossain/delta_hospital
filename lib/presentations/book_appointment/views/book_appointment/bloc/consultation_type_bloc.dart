import 'package:delta_hospital/presentations/book_appointment/data/models/consultation_type_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/book_apt_repository.dart';

@immutable
sealed class ConsultationTypeEvent {}

final class GetConsultationTypeEvent extends ConsultationTypeEvent {
  final int doctorNo;
  final String patTypeNo;
  final int? hospitalNumber;
  final String appointmentDate;

  GetConsultationTypeEvent({
    required this.doctorNo,
    required this.patTypeNo,
    this.hospitalNumber,
    required this.appointmentDate,
  });
}

@immutable
sealed class ConsultationTypeState {}

final class ConsultationTypeInitial extends ConsultationTypeState {}

final class ConsultationTypeLoading extends ConsultationTypeState {}

final class ConsultationTypeSuccess extends ConsultationTypeState {
  final List<ConsultationType> colsuntationTypeList;

  ConsultationTypeSuccess({required this.colsuntationTypeList});
}

final class ConsultationTypeError extends ConsultationTypeState {
  final Object error;

  ConsultationTypeError({required this.error});
}

class ConsultationTypeBloc
    extends Bloc<ConsultationTypeEvent, ConsultationTypeState> {
  final BookAptRepository _bookAptRepository;
  ConsultationTypeBloc(this._bookAptRepository)
      : super(ConsultationTypeInitial()) {
    on<GetConsultationTypeEvent>((event, emit) async {
      emit(ConsultationTypeLoading());
      try {
        var response = await _bookAptRepository.getConsultationType(
          doctorNo: event.doctorNo,
          patTypeNo: event.patTypeNo,
          hospitalNumber: event.hospitalNumber,
          appointmentDate: event.appointmentDate,
        );
        emit(ConsultationTypeSuccess(colsuntationTypeList: response));
      } catch (e) {
        emit(ConsultationTypeError(error: e));
      }
    });
  }
}
