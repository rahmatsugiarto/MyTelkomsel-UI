import 'package:flutter_bloc/flutter_bloc.dart';

import 'paymment_method_state.dart';

class PaymentMethodCubit extends Cubit<PaymentMethodState> {
  PaymentMethodCubit() : super(const PaymentMethodState(valueGroupRadio: 1));

  void setValueGroupRadio(int valueRadio) {
    emit(state.copyWith(valueGroupRadio: valueRadio));
  }
}
