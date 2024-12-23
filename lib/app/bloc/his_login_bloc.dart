import 'package:delta_hospital/app/data/models/user_details_response.dart';
import 'package:delta_hospital/app/data/repositories/app_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class HisLoginEvent {}

final class HisLogin extends HisLoginEvent {
  final String username;
  final String password;

  HisLogin({
    required this.username,
    required this.password,
  });
}

@immutable
sealed class HisLoginState {}

final class HisLoginInitial extends HisLoginState {}

final class HisLoginSuccess extends HisLoginState {
  final UserDetails userDetails;

  HisLoginSuccess({required this.userDetails});
}

final class HisLoginError extends HisLoginState {
  final Object error;

  HisLoginError({required this.error});
}

final class HisLoginLoading extends HisLoginState {}

class HisLoginBloc extends Bloc<HisLoginEvent, HisLoginState> {
  final AppRepository appRepository;
  HisLoginBloc(this.appRepository) : super(HisLoginInitial()) {
    on<HisLogin>((event, emit) async {
      emit(HisLoginLoading());
      try {
        var auth = await appRepository.authenticate(
            userName: event.username, password: event.password);
        var userDetails = await appRepository.getUserDetails();
        emit(HisLoginSuccess(userDetails: userDetails));
      } catch (e) {
        emit(HisLoginError(error: e));
      }
    });
  }
}
