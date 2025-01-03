import 'dart:async';
import 'dart:developer';

import 'package:delta_hospital/app/data/models/user_details_response.dart';
import 'package:delta_hospital/app/data/repositories/app_repository.dart';
import 'package:delta_hospital/app/ticker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoggedHisUserCubit extends Cubit<UserDetails?> {
  final AppRepository _appRepository;
  final Ticker _ticker;

  StreamSubscription<int>? _tickerSubscription;

  LoggedHisUserCubit(this._appRepository, this._ticker) : super(null);

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void checkLoggedUser() async {
    try {
      final userDetails = await _appRepository.getHisUser();
      final expiryTime = await _appRepository.getHisSessionExpiryTime();
      final Duration remainingTime = expiryTime.difference(DateTime.now());
      if (remainingTime.inSeconds > 0) {
        log("Remaining time: $remainingTime");
        _startTimer(duration: remainingTime);
        emit(userDetails);
      } else {
        emit(null);
      }
    } catch (error) {
      // Log or handle the error as needed.
      log("Error fetching logged user: $error");
      emit(null);
    }
  }

  Future<void> setLoggedUser({required UserDetails userDetails}) async {
    final expiryTime = await _appRepository.getHisSessionExpiryTime();
    final Duration remainingTime = expiryTime.difference(DateTime.now());
    if (remainingTime.inSeconds > 0) {
      log("Remaining time: $remainingTime");
      _startTimer(duration: remainingTime);
      emit(userDetails);
    } else {
      emit(null);
    }
    emit(userDetails);
  }

  void resetState() {
    _tickerSubscription?.cancel();
    emit(null);
  }

  void _startTimer({required Duration duration}) {
    _tickerSubscription?.cancel(); // Ensure no concurrent subscriptions.
    _tickerSubscription =
        _ticker.tick(ticks: duration.inSeconds).listen((remainingTime) {
      if (remainingTime <= 0) {
        resetState();
      }
    });
  }
}
