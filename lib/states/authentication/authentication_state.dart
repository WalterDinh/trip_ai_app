part of 'authentication_bloc.dart';

enum AuthenticationStateStatus {
  initial,
  uninitialized,
  authenticated,
  unauthenticated,
  loading
}

class AuthenticationState {
  final String token;
  final AuthenticationStateStatus status;
  final Exception? error;

  const AuthenticationState._({
    this.status = AuthenticationStateStatus.initial,
    this.token = '',
    this.error,
  });
  const AuthenticationState.initial() : this._();

  AuthenticationState asLoading() {
    return copyWith(
      status: AuthenticationStateStatus.loading,
    );
  }

  AuthenticationState asLoggedOut() {
    return copyWith(
        status: AuthenticationStateStatus.unauthenticated, token: '');
  }

  AuthenticationState asLoggedIn(String token) {
    return copyWith(
        status: AuthenticationStateStatus.authenticated, token: token);
  }

  AuthenticationState copyWith({
    final String? token,
    final AuthenticationStateStatus? status,
    final Exception? error,
  }) {
    return AuthenticationState._(
        status: status ?? this.status,
        token: token ?? this.token,
        error: error ?? this.error);
  }
}
