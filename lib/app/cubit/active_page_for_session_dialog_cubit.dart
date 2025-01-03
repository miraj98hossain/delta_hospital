import 'package:flutter_bloc/flutter_bloc.dart';

class ActivePageForSessionDialogCubit extends Cubit<String> {
  ActivePageForSessionDialogCubit() : super('');

  void changeActivePage(String activePage) {
    emit(activePage);
  }

  void resetState() {
    emit('');
  }
}
