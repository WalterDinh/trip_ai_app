import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/states/personal_info/personal_info_bloc.dart';

class PersonalInfoStateSelector<T>
    extends BlocSelector<PersonalInfoBloc, PersonalInfoState, T> {
  PersonalInfoStateSelector({
    required T Function(PersonalInfoState) selector,
    required Widget Function(T) builder,
  }) : super(
          selector: selector,
          builder: (_, value) => builder(value),
        );
}

class InfoAvatarSelector extends PersonalInfoStateSelector<String> {
  InfoAvatarSelector(Widget Function(String) builder)
      : super(
          selector: (state) => state.avatar,
          builder: builder,
        );
}

class InfoPhoneSelector extends PersonalInfoStateSelector<String> {
  InfoPhoneSelector(Widget Function(String) builder)
      : super(
          selector: (state) => state.phoneNumber,
          builder: builder,
        );
}

class InfoEmailSelector extends PersonalInfoStateSelector<String> {
  InfoEmailSelector(Widget Function(String) builder)
      : super(
          selector: (state) => state.email,
          builder: builder,
        );
}

class InfoGenderSelector extends PersonalInfoStateSelector<String> {
  InfoGenderSelector(Widget Function(String) builder)
      : super(
          selector: (state) => state.gender,
          builder: builder,
        );
}

class InfoCountrySelector extends PersonalInfoStateSelector<String> {
  InfoCountrySelector(Widget Function(String) builder)
      : super(
          selector: (state) => state.country,
          builder: builder,
        );
}

class InfoCurrencySelector extends PersonalInfoStateSelector<String> {
  InfoCurrencySelector(Widget Function(String) builder)
      : super(
          selector: (state) => state.currency,
          builder: builder,
        );
}

class InfoLevelSelector extends PersonalInfoStateSelector<String> {
  InfoLevelSelector(Widget Function(String) builder)
      : super(
          selector: (state) => state.level,
          builder: builder,
        );
}

class InfoPhysicalSelector extends PersonalInfoStateSelector<String> {
  InfoPhysicalSelector(Widget Function(String) builder)
      : super(
          selector: (state) => state.physical,
          builder: builder,
        );
}
