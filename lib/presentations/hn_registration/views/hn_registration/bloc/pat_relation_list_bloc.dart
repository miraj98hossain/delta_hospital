import 'package:delta_hospital/data/models/patient_relation_list_response.dart';
import 'package:delta_hospital/domain/repositories/pat_portal_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class PatRelationListEvent {}

final class PatRelationListGet extends PatRelationListEvent {}

@immutable
sealed class PatRelationListState {}

final class PatRelationListInitial extends PatRelationListState {}

final class PatRelationListSuccess extends PatRelationListState {
  final List<PatientRelation> patientRelationList;
  PatRelationListSuccess({required this.patientRelationList});
}

final class PatRelationListError extends PatRelationListState {
  final Object error;

  PatRelationListError({required this.error});
}

final class PatRelationListLoading extends PatRelationListState {}

class PatRelationListBloc
    extends Bloc<PatRelationListEvent, PatRelationListState> {
  final PatPortalRepository patPortalRepository;
  PatRelationListBloc(this.patPortalRepository)
      : super(PatRelationListInitial()) {
    on<PatRelationListGet>((event, emit) async {
      emit(PatRelationListLoading());
      try {
        var response = await patPortalRepository.getPatientRelationList();
        emit(PatRelationListSuccess(patientRelationList: response));
      } catch (e) {
        emit(PatRelationListError(error: e));
      }
    });
  }
}
