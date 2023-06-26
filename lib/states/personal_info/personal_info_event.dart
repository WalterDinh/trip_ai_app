part of 'personal_info_bloc.dart';

abstract class PersonalInfoEvent {
  const PersonalInfoEvent();
}

class GetPersonalInfoEvent extends PersonalInfoEvent {
  const GetPersonalInfoEvent();
}

class UpdateAvatarEvent extends PersonalInfoEvent {
  final String avatar;

  const UpdateAvatarEvent(this.avatar);
}

class UpdateGenderEvent extends PersonalInfoEvent {
  final String gender;

  const UpdateGenderEvent(this.gender);
}

class UpdateCountryEvent extends PersonalInfoEvent {
  final String country;

  const UpdateCountryEvent(this.country);
}

class UpdateCurrencyEvent extends PersonalInfoEvent {
  final String currency;

  const UpdateCurrencyEvent(this.currency);
}

class UpdateLevelEvent extends PersonalInfoEvent {
  final String level;

  const UpdateLevelEvent(this.level);
}

class UpdatePhysicalEvent extends PersonalInfoEvent {
  final String physical;

  const UpdatePhysicalEvent(this.physical);
}
