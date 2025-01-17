import 'package:delta_hospital/app/data/models/app_login_response.dart';
import 'package:delta_hospital/app/domain/repositories/app_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class AppAuthEvent {}

final class AppLogin extends AppAuthEvent {
  final String username;
  final String password;

  AppLogin({
    required this.username,
    required this.password,
  });
}

final class AppLogout extends AppAuthEvent {}

@immutable
sealed class AppAuthState {}

final class AppAuthInitial extends AppAuthState {}

final class AppAuthLoggedIn extends AppAuthState {
  final AppUserDetails userDetails;

  AppAuthLoggedIn({required this.userDetails});
}

final class AppAuthLoggedOut extends AppAuthState {
  AppAuthLoggedOut();
}

final class AppAuthError extends AppAuthState {
  final Object error;

  AppAuthError({required this.error});
}

final class AppAuthLoading extends AppAuthState {}

class AppAuthBloc extends Bloc<AppAuthEvent, AppAuthState> {
  final AppRepository appRepository;
  AppAuthBloc(this.appRepository) : super(AppAuthInitial()) {
    on<AppLogin>((event, emit) async {
      emit(AppAuthLoading());
      try {
        var appUser = await appRepository.appLogin(
          phone: event.username,
          password: event.password,
        );

        emit(AppAuthLoggedIn(userDetails: appUser));
      } catch (e) {
        emit(AppAuthError(error: e));
      }
    });
    on<AppLogout>((event, emit) async {
      emit(AppAuthLoading());
      try {
        await appRepository.applogout();
        emit(AppAuthLoggedOut());
      } catch (e) {
        emit(AppAuthError(error: e));
      }
    });
  }
}
