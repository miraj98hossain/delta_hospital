import 'package:delta_hospital/presentations/book_appointment/data/models/online_sepcialization_list_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/book_apt_repository.dart';

@immutable
sealed class SpecializationEvent {}

final class GetSpecializationEvent extends SpecializationEvent {}

@immutable
sealed class SpecializationState {}

final class SpecializationInitial extends SpecializationState {}

final class SpecializationLoading extends SpecializationState {}

final class SpecializationSuccess extends SpecializationState {
  final List<Specialization> specList;

  SpecializationSuccess({required this.specList});
}

final class SpecializationError extends SpecializationState {
  final Object error;

  SpecializationError({required this.error});
}

class SpecializationBloc
    extends Bloc<SpecializationEvent, SpecializationState> {
  final BookAptRepository _bookAptRepository;
  SpecializationBloc(this._bookAptRepository) : super(SpecializationInitial()) {
    on<GetSpecializationEvent>((event, emit) async {
      emit(SpecializationLoading());
      try {
        var response = await _bookAptRepository.getOnlineSpecializationtList();
        emit(SpecializationSuccess(specList: response));
      } catch (e) {
        emit(SpecializationError(error: e));
      }
    });
  }
}
