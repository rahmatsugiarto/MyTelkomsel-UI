class LoginState {
  final bool isAgree;
  final bool isEmpty;

  const LoginState({
    required this.isAgree,
    required this.isEmpty,
  });

  LoginState copyWith({
    bool? isAgree,
    bool? isEmpty,
  }) {
    return LoginState(
      isAgree: isAgree ?? this.isAgree,
      isEmpty: isEmpty ?? this.isEmpty,
    );
  }
}
