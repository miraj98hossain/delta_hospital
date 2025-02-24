import 'package:delta_hospital/presentations/patient_portal/data/models/patient_notes_gridlist_response.dart';
import 'package:delta_hospital/presentations/patient_portal/domain/repositories/pat_portal_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class NotesEvent {}

final class GetNotesEvent extends NotesEvent {
  final int start;
  final int length;

  GetNotesEvent({this.start = 0, this.length = 100});
}

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesLoading extends NotesState {}

final class NotesSuccess extends NotesState {
  final NotesGridList notesGridList;

  NotesSuccess({required this.notesGridList});
}

final class NotesError extends NotesState {
  final Object error;

  NotesError({required this.error});
}

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final PatPortalRepository _repository;
  NotesBloc(this._repository) : super(NotesInitial()) {
    on<GetNotesEvent>((event, emit) async {
      emit(NotesLoading());
      try {
        var response = await _repository.getNotesByAccessToken(
            start: event.start, length: event.length);
        emit(NotesSuccess(notesGridList: response));
      } catch (e) {
        emit(NotesError(error: e));
      }
    });
  }
}
