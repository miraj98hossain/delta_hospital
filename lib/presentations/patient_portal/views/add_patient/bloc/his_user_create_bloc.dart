import 'package:delta_hospital/app/data/models/app_login_response.dart';
import 'package:delta_hospital/app/data/models/his_patient_info_response.dart';
import 'package:delta_hospital/app/data/models/patient_relation_list_response.dart';
import 'package:delta_hospital/presentations/patient_portal/domain/repositories/pat_portal_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class HisUserCreateEvent {}

final class HisUserCreate extends HisUserCreateEvent {
  final String mrn;
  final PatientRelation relation;
  final String refId;

  HisUserCreate({
    required this.mrn,
    required this.relation,
    required this.refId,
  });
}

@immutable
sealed class HisUserCreateState {}

final class HisUserCreateInitial extends HisUserCreateState {}

final class HisUserCreateSuccess extends HisUserCreateState {
  final HisPatientInfo hisPatientInfo;
  HisUserCreateSuccess({required this.hisPatientInfo});
}

final class HisUserCreateError extends HisUserCreateState {
  final Object error;

  HisUserCreateError({required this.error});
}

final class HisUserCreateLoading extends HisUserCreateState {}

class HisUserCreateBloc extends Bloc<HisUserCreateEvent, HisUserCreateState> {
  final PatPortalRepository patPortalRepository;
  HisUserCreateBloc(this.patPortalRepository) : super(HisUserCreateInitial()) {
    on<HisUserCreate>((event, emit) async {
      emit(HisUserCreateLoading());
      try {
        var response =
            await patPortalRepository.findRegAndCreateUser(mrn: event.mrn);
        AppUserDetails userDetails = AppUserDetails(
          phone: response.phoneMobile,
          mrn: response.hospitalNumber,
          firstName: response.fname,
          lastName: response.lname,
          userImage: response.photo,
          dateOfBirth: response.dob,
          ageYear: response.ageYy,
          ageMonth: response.ageMm,
          ageDay: response.ageDd,
          gender: response.gender,
          email: response.email,
          fullAddress: response.address,
          relationship: event.relation.relationName,
          refId: event.refId,
          type: event.relation.relationType,
        );
        await patPortalRepository.savePatientPortalUser(
            userDetails: userDetails);
        emit(HisUserCreateSuccess(hisPatientInfo: response));
      } catch (e) {
        emit(HisUserCreateError(error: e));
      }
    });
  }
}
