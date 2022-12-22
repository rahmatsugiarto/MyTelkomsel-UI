class SuccessTransactionState {
  final bool isGoodExp;
  final bool isBadExp;

  const SuccessTransactionState({
    required this.isGoodExp,
    required this.isBadExp,
  });

  SuccessTransactionState copyWith({
    bool? isGoodExp,
    bool? isBadExp,
  }) {
    return SuccessTransactionState(
      isGoodExp: isGoodExp ?? this.isGoodExp,
      isBadExp: isBadExp ?? this.isBadExp,
    );
  }
}
