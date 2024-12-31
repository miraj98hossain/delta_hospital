import 'package:delta_hospital/features/patient_portal/domain/repositories/pat_portal_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class AddNoteEvent {}

final class CreateNoteEvent extends AddNoteEvent {
  final String title;
  final String description;

  CreateNoteEvent({required this.title, required this.description});
}

@immutable
sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

final class AddNoteLoading extends AddNoteState {}

final class AddNoteSuccess extends AddNoteState {}

final class AddNoteError extends AddNoteState {
  final Object error;

  AddNoteError({required this.error});
}

class AddNoteBloc extends Bloc<AddNoteEvent, AddNoteState> {
  final PatPortalRepository _repository;
  AddNoteBloc(this._repository) : super(AddNoteInitial()) {
    on<CreateNoteEvent>((event, emit) async {
      emit(AddNoteLoading());
      try {
        await _repository.addNoteByAccessToken(
            title: event.title, description: event.description);
        emit(AddNoteSuccess());
      } catch (e) {
        emit(AddNoteError(error: e));
      }
    });
  }
}
