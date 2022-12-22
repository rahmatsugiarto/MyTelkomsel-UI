import 'package:bloc/bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState(isAgree: false, isEmpty: false));

  void isAgree() {
    emit(state.copyWith(isAgree: !state.isAgree));
  }

  void checkNumberIsNotEmpty(String number) {
    if (number.trim().isNotEmpty) {
      emit(state.copyWith(isEmpty: true));
    } else {
      emit(state.copyWith(isEmpty: false));
    }
  }
}
