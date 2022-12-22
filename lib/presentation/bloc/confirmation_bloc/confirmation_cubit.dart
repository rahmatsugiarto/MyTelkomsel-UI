import 'package:bloc/bloc.dart';

import 'confirmation_state.dart';

class ConfirmationCubit extends Cubit<ConfirmationState> {
  ConfirmationCubit()
      : super(const ConfirmationState(isLoading: false, isEmpty: false));

  void submitUniqueCode() {
    emit(state.copyWith(isLoading: true));
  }

  void checkNumberIsNotEmpty(String number) {
    if (number.trim().isNotEmpty) {
      emit(state.copyWith(isEmpty: true));
    } else {
      emit(state.copyWith(isEmpty: false));
    }
  }
}
