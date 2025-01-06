import 'dart:async';
import 'dart:developer';

import 'package:delta_hospital/app/data/models/app_login_response.dart';

import 'package:delta_hospital/app/data/repositories/app_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoggedAppUserCubit extends Cubit<AppUserDetails?> {
  final AppRepository _appRepository;

  LoggedAppUserCubit(
    this._appRepository,
  ) : super(null);

  void checkLoggedAppUser() async {
    try {
      final userDetails = await _appRepository.getAppUser();

      emit(userDetails);
    } catch (error) {
      // Log or handle the error as needed.
      log("Error fetching logged App user: $error");
      emit(null);
    }
  }

  Future<void> setLoggedAppUser({required AppUserDetails userDetails}) async {
    emit(userDetails);
  }

  void resetState() {
    emit(null);
  }
}
