import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stream_transform/stream_transform.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.initial()) {
    on<LoginWithEmailPassword>(_onLoginWithEmailAndPassword,
        transformer: (events, mapper) => events.switchMap(mapper));
    on<LoginWithSocial>(_onLoginWitSocial,
        transformer: (events, mapper) => events.switchMap(mapper));
  }

  void _onLoginWithEmailAndPassword(
      LoginWithEmailPassword event, Emitter<LoginState> emit) async {
    try {
      emit(state.asLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(state.asLoginSuccess(''));
    } on Exception catch (e) {
      emit(state.asLoginFailure(e));
    }
  }

  void _onLoginWitSocial(
      LoginWithSocial event, Emitter<LoginState> emit) async {
    try {
      emit(state.asLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(state.asLoginSuccess(''));
    } on Exception catch (e) {
      emit(state.asLoginFailure(e));
    }
  }
}
