import 'package:delta_hospital/presentations/book_appointment/data/models/doctor_grid_list_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/book_apt_repository.dart';

@immutable
sealed class OnlineDoctorGridEvent {}

final class GetOnlineDoctorGridEvent extends OnlineDoctorGridEvent {
  final int length;
  final int? departmentNo;
  final int? specializationNo;
  final String searchValue;

  GetOnlineDoctorGridEvent({
    this.length = 10,
    this.departmentNo,
    this.specializationNo,
    this.searchValue = '',
  });
}

class OnlineDoctorGridState {
  final bool isInitial;
  final bool isLoading;
  final bool isError;
  final String errorMessage;
  final DoctorGridList doctorGridList;

  const OnlineDoctorGridState({
    this.isInitial = false,
    this.isLoading = false,
    this.isError = false,
    this.errorMessage = '',
    required this.doctorGridList,
  });

  OnlineDoctorGridState copyWith({
    bool? isInitial,
    bool? isLoading,
    bool? isError,
    String? errorMessage,
    DoctorGridList? doctorGridList,
  }) {
    return OnlineDoctorGridState(
      isInitial: isInitial ?? this.isInitial,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      doctorGridList: doctorGridList ?? this.doctorGridList,
    );
  }
}

class OnlineDoctorGridBloc
    extends Bloc<OnlineDoctorGridEvent, OnlineDoctorGridState> {
  final BookAptRepository _bookAptRepository;

  OnlineDoctorGridBloc(this._bookAptRepository)
      : super(OnlineDoctorGridState(
            isInitial: true, doctorGridList: DoctorGridList())) {
    on<GetOnlineDoctorGridEvent>((event, emit) async {
      emit(state.copyWith(
          isInitial: false, isLoading: true, isError: false, errorMessage: ''));
      try {
        var response = await _bookAptRepository.getDoctorGridList(
          length: event.length,
          departmentNo: event.departmentNo,
          specializationNos:
              event.specializationNo != null ? [event.specializationNo!] : null,
          searchValue: event.searchValue,
        );

        await Future.delayed(const Duration(seconds: 1), () {
          emit(state.copyWith(
            isLoading: false,
            doctorGridList: response,
          ));
        });
      } catch (e) {
        emit(state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: e.toString(),
        ));
      }
    });
  }
}
