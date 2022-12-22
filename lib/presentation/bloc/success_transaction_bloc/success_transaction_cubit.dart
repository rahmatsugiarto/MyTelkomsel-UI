import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telkomsel_ui/presentation/bloc/success_transaction_bloc/success_transaction_state.dart';

class SuccessTransactionCubit extends Cubit<SuccessTransactionState> {
  SuccessTransactionCubit()
      : super(const SuccessTransactionState(isGoodExp: false, isBadExp: false));

  void setExperienceTransaction(bool isGood) {
    if (isGood) {
      emit(state.copyWith(isGoodExp: true, isBadExp: false));
    } else {
      emit(state.copyWith(isGoodExp: false, isBadExp: true));
    }
  }

  void clearExpTransaction() {
    emit(state.copyWith(isGoodExp: false, isBadExp: false));
  }
}
