part of 'sign_up_cubit.dart';

enum SignUpStateStatus { initial, loading, loadSuccess, loadFailure }

class SignUpState {
  const SignUpState._({
    this.status = SignUpStateStatus.initial,
    this.email,
    this.password,
    this.confirmPassword,
    this.name,
    this.dateOfBirth,
    this.gender,
    this.favoriteList = const [],
  });
  final String? email;
  final String? password;
  final String? confirmPassword;
  final String? name;
  final DateTime? dateOfBirth;
  final ItemGender? gender;
  final List<FavoriteActivity>? favoriteList;
  final SignUpStateStatus? status;

  const SignUpState.initial() : this._();

  SignUpState asLoading() {
    return copyWith(
      status: SignUpStateStatus.loading,
    );
  }

  SignUpState copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    String? name,
    DateTime? dateOfBirth,
    SignUpStateStatus? status,
    ItemGender? gender,
    List<FavoriteActivity>? favoriteList,
  }) {
    return SignUpState._(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      favoriteList: favoriteList ?? this.favoriteList,
    );
  }
}
