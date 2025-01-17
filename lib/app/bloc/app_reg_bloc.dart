import 'package:delta_hospital/app/data/models/app_login_response.dart';
import 'package:delta_hospital/app/domain/repositories/app_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class AppRegEvent {}

final class AppRegistration extends AppRegEvent {
  final AppUserDetails userDetails;

  AppRegistration({
    required this.userDetails,
  });
}

@immutable
sealed class AppRegState {}

final class AppRegInitial extends AppRegState {}

final class AppRegSuccess extends AppRegState {
  final AppUserDetails userDetails;

  AppRegSuccess({required this.userDetails});
}

final class AppRegError extends AppRegState {
  final Object error;

  AppRegError({required this.error});
}

final class AppRegLoading extends AppRegState {}

class AppRegBloc extends Bloc<AppRegEvent, AppRegState> {
  final AppRepository appRepository;
  AppRegBloc(this.appRepository) : super(AppRegInitial()) {
    on<AppRegistration>((event, emit) async {
      emit(AppRegLoading());
      try {
        await appRepository.appRegistration(userDetails: event.userDetails);
        var appUser = await appRepository.appLogin(
            phone: event.userDetails.phone!,
            password: event.userDetails.password!);

        emit(AppRegSuccess(userDetails: appUser));
      } catch (e) {
        emit(AppRegError(error: e));
      }
    });
  }
}
