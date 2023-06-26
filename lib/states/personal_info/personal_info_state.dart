part of 'personal_info_bloc.dart';

class PersonalInfoState {
  final String avatar;
  final String phoneNumber;
  final String email;
  final String gender;
  final String country;
  final String currency;
  final String level;
  final String physical;

  const PersonalInfoState._({
    this.avatar = "",
    this.phoneNumber = "",
    this.email = "",
    this.gender = "",
    this.country = "",
    this.currency = "",
    this.level = "",
    this.physical = "",
  });

  // final PersonalInfo info;

  const PersonalInfoState.initial() : this._();

  PersonalInfoState asLoadGetPersonalInfo(
    String avatar,
    String phoneNumber,
    String email,
    String gender,
    String country,
    String currency,
    String level,
    String physical,
  ) {
    return copyWith(
      avatar: avatar,
      phoneNumber: phoneNumber,
      email: email,
      gender: gender,
      country: country,
      currency: currency,
      level: level,
      physical: physical,
    );
  }

  PersonalInfoState asUpdateAvatar(String avatar) {
    return copyWith(avatar: avatar);
  }

  PersonalInfoState asUpdateGender(String gender) {
    return copyWith(gender: gender);
  }

  PersonalInfoState asUpdateCountry(String country) {
    return copyWith(country: country);
  }

  PersonalInfoState asUpdateCurrency(String currency) {
    return copyWith(currency: currency);
  }

  PersonalInfoState asUpdateLevel(String level) {
    return copyWith(level: level);
  }

  PersonalInfoState asUpdatePhysical(String physical) {
    return copyWith(physical: physical);
  }

  PersonalInfoState copyWith({
    final String? avatar,
    final String? phoneNumber,
    final String? email,
    final String? gender,
    final String? country,
    final String? currency,
    final String? level,
    final String? physical,
  }) {
    return PersonalInfoState._(
      avatar: avatar ?? this.avatar,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      currency: currency ?? this.currency,
      level: level ?? this.level,
      physical: physical ?? this.physical,
    );
  }
}
