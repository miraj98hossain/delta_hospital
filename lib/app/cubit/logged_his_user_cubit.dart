import 'package:delta_hospital/app/data/models/user_details_response.dart';
import 'package:delta_hospital/app/data/repositories/app_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoggedHisUserCubit extends Cubit<UserDetails?> {
  final AppRepository _appRepository;
  LoggedHisUserCubit(this._appRepository) : super(null);
  void checkLoggedUser() async {
    try {
      var response = await _appRepository.getHisUser();
      emit(response);
    } catch (error) {
      emit(null);
    }
  }

  void setLoggedUser({required UserDetails userDetails}) async {
    emit(userDetails);
  }

  void resetState() async {
    emit(null);
  }
}
