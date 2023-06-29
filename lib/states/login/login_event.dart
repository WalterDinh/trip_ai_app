part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {
  const LoginEvent();
}

class LoginWithEmailPassword extends LoginEvent {
  final String email;
  final String password;

  const LoginWithEmailPassword(this.email, this.password);
}

class LoginWithSocial extends LoginEvent {
  final String type;
  final String token;
  final String? email;

  const LoginWithSocial(this.type, this.token, this.email);
}
