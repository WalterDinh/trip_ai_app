import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(const ChangePasswordState.initial());

  void onChangePassword(
    String currentPassword,
    String newPassword,
    String confirmPassword,
  ) {
    emit(state.asLoading());

    emit(state.copyWith(
        currentPassword: currentPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword));
    try {
      emit(state.asChangePasswordSuccess());
    } on Exception catch (e) {
      emit(state.asChangePasswordFailure(e));
    }
  }
}
