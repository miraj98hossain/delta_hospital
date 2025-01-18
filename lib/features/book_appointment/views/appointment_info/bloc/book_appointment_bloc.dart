import 'package:delta_hospital/features/book_appointment/data/models/appointment.dart';
import 'package:delta_hospital/features/book_appointment/data/models/appointment_booking_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/book_apt_repository.dart';

@immutable
sealed class BookAppointmentEvent {}

final class BookAppointment extends BookAppointmentEvent {
  final Appointment appointment;

  BookAppointment({
    required this.appointment,
  });
}

@immutable
sealed class BookAppointmentState {}

final class BookAppointmentInitial extends BookAppointmentState {}

final class BookAppointmentLoading extends BookAppointmentState {}

final class BookAppointmentSuccess extends BookAppointmentState {
  final AppointmentBookingStatus appointmentBookingStatus;

  BookAppointmentSuccess({required this.appointmentBookingStatus});
}

final class BookAppointmentError extends BookAppointmentState {
  final Object error;

  BookAppointmentError({required this.error});
}

class BookAppointmentBloc
    extends Bloc<BookAppointmentEvent, BookAppointmentState> {
  final BookAptRepository _bookAptRepository;
  BookAppointmentBloc(this._bookAptRepository)
      : super(BookAppointmentInitial()) {
    on<BookAppointment>((event, emit) async {
      emit(BookAppointmentLoading());
      try {
        var response = await _bookAptRepository.bookAppointment(
          appointment: event.appointment,
        );
        emit(BookAppointmentSuccess(appointmentBookingStatus: response));
      } catch (e) {
        emit(BookAppointmentError(error: e));
      }
    });
  }
}
