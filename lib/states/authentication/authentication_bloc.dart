import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stream_transform/stream_transform.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState.initial()) {
    on<LoggedIn>(onHandleLogin,
        transformer: (events, mapper) => events.switchMap(mapper));
    on<AppStarted>(onHandleAppStarted,
        transformer: (events, mapper) => events.switchMap(mapper));
    on<LoggedOut>(onHandleLogout,
        transformer: (events, mapper) => events.switchMap(mapper));
  }

  void onHandleLogin(LoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(state.asLoggedIn(''));
  }

  void onHandleAppStarted(
      AppStarted event, Emitter<AuthenticationState> emit) async {
    emit(state.asLoggedIn(''));
  }

  void onHandleLogout(
      LoggedOut event, Emitter<AuthenticationState> emit) async {
    try {
      emit(state.asLoggedOut());
    } on Exception catch (e) {}
  }
}
