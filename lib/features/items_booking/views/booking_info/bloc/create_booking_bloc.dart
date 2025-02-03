import 'package:delta_hospital/features/items_booking/data/data_sources/items_booking_remote_data_source.dart';
import 'package:delta_hospital/features/items_booking/data/models/booking_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class CreateBookingEvent {}

final class CreateBooking extends CreateBookingEvent {
  final BookingInfoModel bookingInfoModel;

  CreateBooking({
    required this.bookingInfoModel,
  });
}

@immutable
sealed class CreateBookingState {}

final class CreateBookingInitial extends CreateBookingState {}

final class CreateBookingLoading extends CreateBookingState {}

final class CreateBookingSuccess extends CreateBookingState {
  CreateBookingSuccess();
}

final class CreateBookingError extends CreateBookingState {
  final Object error;

  CreateBookingError({required this.error});
}

class CreateBookingBloc extends Bloc<CreateBookingEvent, CreateBookingState> {
  final ItemsBookingRemoteDataSource _itemBookingRepository;
  CreateBookingBloc(this._itemBookingRepository)
      : super(CreateBookingInitial()) {
    on<CreateBooking>((event, emit) async {
      emit(CreateBookingLoading());
      try {
        await _itemBookingRepository.createBooking(
          bookingInfoModel: event.bookingInfoModel,
        );
        emit(CreateBookingSuccess());
      } catch (e) {
        emit(CreateBookingError(error: e));
      }
    });
  }
}
