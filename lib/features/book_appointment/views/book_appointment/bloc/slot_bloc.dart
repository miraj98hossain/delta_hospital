import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/available_slot_response.dart';
import '../../../domain/repositories/book_apt_repository.dart';

@immutable
sealed class SlotEvent {}

final class GetSlotEvent extends SlotEvent {
  final int doctorNo;
  final String appointmentDate;

  GetSlotEvent({
    required this.doctorNo,
    required this.appointmentDate,
  });
}

@immutable
sealed class SlotState {}

final class SlotInitial extends SlotState {}

final class SlotLoading extends SlotState {}

final class SlotSuccess extends SlotState {
  final List<Slot> availableSlotList;

  SlotSuccess({required this.availableSlotList});
}

final class SlotError extends SlotState {
  final Object error;

  SlotError({required this.error});
}

class SlotBloc extends Bloc<SlotEvent, SlotState> {
  final BookAptRepository _bookAptRepository;
  SlotBloc(this._bookAptRepository) : super(SlotInitial()) {
    on<GetSlotEvent>((event, emit) async {
      emit(SlotLoading());
      try {
        var response = await _bookAptRepository.getAvailableSlot(
          doctorNo: event.doctorNo,
          appointDate: event.appointmentDate,
        );
        emit(SlotSuccess(availableSlotList: response));
      } catch (e) {
        emit(SlotError(error: e));
      }
    });
  }
}
