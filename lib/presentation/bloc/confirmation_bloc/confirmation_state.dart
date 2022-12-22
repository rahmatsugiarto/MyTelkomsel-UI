class ConfirmationState {
  final bool isLoading;
  final bool isEmpty;

  const ConfirmationState({
    required this.isLoading,
    required this.isEmpty,
  });

  ConfirmationState copyWith({
    bool? isLoading,
    bool? isEmpty,
  }) {
    return ConfirmationState(
      isLoading: isLoading ?? this.isLoading,
      isEmpty: isEmpty ?? this.isEmpty,
    );
  }
}
