part of 'login_bloc.dart';

enum LoginStateStatus {
  initial,
  loading,
  loginSuccess,
  loginFailure,
}

class LoginState {
  final String token;
  final LoginStateStatus status;
  final Exception? error;

  const LoginState._({
    this.status = LoginStateStatus.initial,
    this.token = '',
    this.error,
  });
  const LoginState.initial() : this._();

  LoginState asLoading() {
    return copyWith(
      status: LoginStateStatus.loading,
    );
  }

  LoginState asLoginFailure(Exception e) {
    return copyWith(
      status: LoginStateStatus.loginFailure,
      error: e,
    );
  }

  LoginState asLoginSuccess(String token) {
    return copyWith(status: LoginStateStatus.loginSuccess, token: token);
  }

  LoginState copyWith({
    final String? token,
    final LoginStateStatus? status,
    final Exception? error,
  }) {
    return LoginState._(
        status: status ?? this.status,
        token: token ?? this.token,
        error: error ?? this.error);
  }
}
