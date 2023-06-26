import 'package:flutter_bloc/flutter_bloc.dart';

part 'personal_info_event.dart';

part 'personal_info_state.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  PersonalInfoBloc() : super(const PersonalInfoState.initial()) {
    on<GetPersonalInfoEvent>(_onGetPersonalInfo);
    on<UpdateAvatarEvent>(_onUpdateAvatar);
    on<UpdateGenderEvent>(_onUpdateGender);
    on<UpdateCountryEvent>(_onUpdateCountry);
    on<UpdateCurrencyEvent>(_onUpdateCurrency);
    on<UpdateLevelEvent>(_onUpdateLevel);
    on<UpdatePhysicalEvent>(_onUpdatePhysical);
  }

  void _onGetPersonalInfo(
      GetPersonalInfoEvent event, Emitter<PersonalInfoState> emitter) {
    String avatar =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU";
    String phoneNumber = "0987654321";
    String email = "email@email.com";
    String gender = "Nam";
    String country = "Viet Nam";
    String currency = "VND";
    String level = "Expert";
    String physical = "Good";

    emitter(state.asLoadGetPersonalInfo(avatar, phoneNumber, email, gender,
        country, currency, level, physical));
  }

  void _onUpdateAvatar(
      UpdateAvatarEvent event, Emitter<PersonalInfoState> emitter) {
    emitter(state.asUpdateAvatar(event.avatar));
  }

  void _onUpdateGender(
      UpdateGenderEvent event, Emitter<PersonalInfoState> emitter) {
    emitter(state.asUpdateGender(event.gender));
  }

  void _onUpdateCountry(
      UpdateCountryEvent event, Emitter<PersonalInfoState> emitter) {
    emitter(state.asUpdateCountry(event.country));
  }

  void _onUpdateCurrency(
      UpdateCurrencyEvent event, Emitter<PersonalInfoState> emitter) {
    emitter(state.asUpdateCurrency(event.currency));
  }

  void _onUpdateLevel(
      UpdateLevelEvent event, Emitter<PersonalInfoState> emitter) {
    emitter(state.asUpdateLevel(event.level));
  }

  void _onUpdatePhysical(
      UpdatePhysicalEvent event, Emitter<PersonalInfoState> emitter) {
    emitter(state.asUpdatePhysical(event.physical));
  }
}
