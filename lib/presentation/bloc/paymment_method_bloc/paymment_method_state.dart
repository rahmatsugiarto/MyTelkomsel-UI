class PaymentMethodState {
  final int valueGroupRadio;

  const PaymentMethodState({
    required this.valueGroupRadio,
  });

  PaymentMethodState copyWith({
    int? valueGroupRadio,
  }) {
    return PaymentMethodState(
      valueGroupRadio: valueGroupRadio ?? this.valueGroupRadio,
    );
  }
}
