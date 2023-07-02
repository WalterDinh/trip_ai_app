part of 'change_password_cubit.dart';

enum ChangePasswordStateStatus { initial, loading, loadSuccess, loadFailure }

class ChangePasswordState {
  const ChangePasswordState._(
      {this.status = ChangePasswordStateStatus.initial,
      this.currentPassword,
      this.newPassword,
      this.confirmPassword,
      this.error});
  final String? currentPassword;
  final String? newPassword;
  final String? confirmPassword;
  final ChangePasswordStateStatus status;
  final Exception? error;

  const ChangePasswordState.initial() : this._();

  ChangePasswordState asLoading() {
    return copyWith(
      status: ChangePasswordStateStatus.loading,
    );
  }

  ChangePasswordState asChangePasswordSuccess() {
    return copyWith(
      status: ChangePasswordStateStatus.loadSuccess,
    );
  }

  ChangePasswordState asChangePasswordFailure(Exception e) {
    return copyWith(status: ChangePasswordStateStatus.loadFailure, error: e);
  }

  ChangePasswordState copyWith(
      {String? currentPassword,
      String? newPassword,
      String? confirmPassword,
      ChangePasswordStateStatus? status,
      Exception? error}) {
    return ChangePasswordState._(
        currentPassword: currentPassword ?? this.currentPassword,
        newPassword: newPassword ?? this.newPassword,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        status: status ?? this.status,
        error: error ?? this.error);
  }
}
