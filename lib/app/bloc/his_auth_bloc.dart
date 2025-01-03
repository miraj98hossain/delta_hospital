import 'package:delta_hospital/app/data/models/user_details_response.dart';
import 'package:delta_hospital/app/data/repositories/app_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class HisAuthEvent {}

final class HisLogin extends HisAuthEvent {
  final String username;
  final String password;

  HisLogin({
    required this.username,
    required this.password,
  });
}

final class HisLogout extends HisAuthEvent {}

@immutable
sealed class HisAuthState {}

final class HisAuthInitial extends HisAuthState {}

final class HisAuthLoggedIn extends HisAuthState {
  final UserDetails userDetails;

  HisAuthLoggedIn({required this.userDetails});
}

final class HisAuthLoggedOut extends HisAuthState {
  HisAuthLoggedOut();
}

final class HisAuthError extends HisAuthState {
  final Object error;

  HisAuthError({required this.error});
}

final class HisAuthLoading extends HisAuthState {}

class HisAuthBloc extends Bloc<HisAuthEvent, HisAuthState> {
  final AppRepository appRepository;
  HisAuthBloc(this.appRepository) : super(HisAuthInitial()) {
    on<HisLogin>((event, emit) async {
      emit(HisAuthLoading());
      try {
        var auth = await appRepository.authenticate(
          userName: event.username,
          password: event.password,
        );
        var userDetails = await appRepository.getUserDetails();
        emit(HisAuthLoggedIn(userDetails: userDetails));
      } catch (e) {
        emit(HisAuthError(error: e));
      }
    });
    on<HisLogout>((event, emit) async {
      emit(HisAuthLoading());
      try {
        await appRepository.hisUserlogout();
        emit(HisAuthLoggedOut());
      } catch (e) {
        emit(HisAuthError(error: e));
      }
    });
  }
}
