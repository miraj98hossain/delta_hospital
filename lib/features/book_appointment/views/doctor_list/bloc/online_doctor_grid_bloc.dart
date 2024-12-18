import 'package:delta_hospital/features/book_appointment/data/models/doctor_grid_list_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/book_apt_repository.dart';

@immutable
sealed class OnlineDoctorGridEvent {}

final class GetOnlineDoctorGridEvent extends OnlineDoctorGridEvent {}

@immutable
sealed class OnlineDoctorGridState {}

final class OnlineDoctorGridInitial extends OnlineDoctorGridState {}

final class OnlineDoctorGridLoading extends OnlineDoctorGridState {}

final class OnlineDoctorGridSuccess extends OnlineDoctorGridState {
  final DoctorGridList doctorGridList;

  OnlineDoctorGridSuccess({required this.doctorGridList});
}

final class OnlineDoctorGridError extends OnlineDoctorGridState {
  final Object error;

  OnlineDoctorGridError({required this.error});
}

class OnlineDoctorGridBloc
    extends Bloc<OnlineDoctorGridEvent, OnlineDoctorGridState> {
  final BookAptRepository _bookAptRepository;
  OnlineDoctorGridBloc(this._bookAptRepository)
      : super(OnlineDoctorGridInitial()) {
    on<GetOnlineDoctorGridEvent>((event, emit) async {
      emit(OnlineDoctorGridLoading());
      try {
        var response = await _bookAptRepository.getDoctorGridList();
        emit(OnlineDoctorGridSuccess(doctorGridList: response));
      } catch (e) {
        emit(OnlineDoctorGridError(error: e));
      }
    });
  }
}
