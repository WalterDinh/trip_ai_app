import 'dart:async';
import 'dart:ui';

import 'package:country_picker/country_picker.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/core/base/base_widget_screen_mixin.dart';
import 'package:my_app/states/personal_info/personal_info_bloc.dart';
import 'package:my_app/states/personal_info/personal_info_selector.dart';
import 'package:my_app/ui/screens/personal_info/modals/gender_modal.dart';
import 'package:my_app/ui/screens/personal_info/modals/level_modal.dart';
import 'package:my_app/ui/screens/personal_info/modals/physical_modal.dart';
import 'package:my_app/ui/screens/personal_info/widgets/item_info.dart';
import 'package:my_app/ui/widgets/cache_image.dart';
import 'package:my_app/ui/widgets/elevated_container.dart';
import 'package:my_app/ui/widgets/image_picker/image_picker_modal.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen>
    with BaseState {
  PersonalInfoBloc get personalInfoBloc => context.read<PersonalInfoBloc>();

  @override
  void initState() {
    scheduleMicrotask(() {
      personalInfoBloc.add(const GetPersonalInfoEvent());
    });
    super.initState();
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          _personalInfoContainer(),
          const VSpacer(24),
          _personalInfo1(),
          const VSpacer(16),
          _personalInfo2(),
          const VSpacer(16),
          VSpacer(MediaQuery.of(context).padding.bottom)
        ],
      ),
    );
  }

  Widget _personalInfoContainer() {
    double height = 210;

    return SizedBox(
      height: height,
      child: Stack(fit: StackFit.expand, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: _personalInfoBackdrop(),
        ),
        _personalInfo(),
      ]),
    );
  }

  Widget _personalInfo() {
    return Column(
      children: [
        const VSpacer(24),
        _personalAvatar(),
        const VSpacer(14),
        const Text(
          'Nguyen Gnauq',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        const VSpacer(6),
        Text(
          'UX/UI Designer',
          style: TextStyle(
              color: Colors.grey.shade300,
              fontWeight: FontWeight.w400,
              fontSize: 12),
        ),
        const VSpacer(14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '1599 Following',
              style: TextStyle(
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
            Text(
              '599 Follower',
              style: TextStyle(
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          ],
        )
      ],
    );
  }

  SizedBox _personalAvatar() {
    double avatarSize = 88;

    return SizedBox(
      width: avatarSize,
      height: avatarSize,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(avatarSize / 2),
        child: GestureDetector(
          onTap: _onPickImage,
          child: InfoAvatarSelector(
            (avatar) => CacheImage(
              fit: BoxFit.cover,
              path: avatar,
            ),
          ),
        ),
      ),
    );
  }

  Widget _personalInfoBackdrop() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: const Image(
          image: AppImages.introduction2,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _personalInfo1() {
    return ElevatedContainer(
      bgColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          InfoPhoneSelector(
            (phone) => ItemInfo(label: 'Số điện thoại', content: phone),
          ),
          _divider(),
          InfoEmailSelector(
            (email) => ItemInfo(label: 'Email', content: email),
          ),
          _divider(),
          InfoGenderSelector(
            (gender) {
              return ItemInfo(
                label: 'Giới tính',
                content: gender,
                onTap: _onTapGender,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _personalInfo2() {
    return ElevatedContainer(
      bgColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          InfoCountrySelector(
            (country) => ItemInfo(
              label: 'Quốc gia',
              content: country,
              onTap: _onTapCountry,
            ),
          ),
          _divider(),
          InfoCurrencySelector(
            (currency) => ItemInfo(
              label: 'Tiền tệ',
              content: currency,
              onTap: _onTapCurrency,
            ),
          ),
          _divider(),
          InfoLevelSelector(
            (level) => ItemInfo(
              label: 'Trình độ',
              content: level,
              onTap: _onTapLevel,
            ),
          ),
          _divider(),
          InfoPhysicalSelector(
            (physical) => ItemInfo(
              label: 'Thể lực',
              content: physical,
              onTap: _onTapPhysical,
            ),
          ),
        ],
      ),
    );
  }

  Divider _divider() =>
      const Divider(height: 1, color: AppColors.itemHandleColor);

  void _onTapGender() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return GenderModal(
          onSelect: (gender) {
            personalInfoBloc.add(UpdateGenderEvent(gender.label));
          },
        );
      },
    );
  }

  void _onTapCountry() {
    double height = MediaQuery.of(context).size.height * 0.7;
    showCountryPicker(
      countryListTheme: CountryListThemeData(
          inputDecoration: InputDecoration(
            hintText: 'Search',
            hintStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.textHintColorGrey),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.grey800, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.circular(15),
          bottomSheetHeight: height),
      context: context,
      onSelect: (country) {
        personalInfoBloc.add(UpdateCountryEvent(country.name));
      },
    );
  }

  void _onTapCurrency() {
    double height = MediaQuery.of(context).size.height * 0.7;
    showCurrencyPicker(
      theme: CurrencyPickerThemeData(
        backgroundColor: Colors.white,
        bottomSheetHeight: height,
      ),
      context: context,
      onSelect: (currency) {
        personalInfoBloc.add(UpdateCurrencyEvent(currency.name));
      },
    );
  }

  _onTapLevel() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return LevelModal(
          onSelect: (level) {
            personalInfoBloc.add(UpdateLevelEvent(level.label));
          },
        );
      },
    );
  }

  _onTapPhysical() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return PhysicalModal(
          onSelect: (physical) {
            print('physical: $physical');
            personalInfoBloc.add(UpdatePhysicalEvent(physical.label));
          },
        );
      },
    );
  }

  void _onPickImage() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ImagePickerModal(
          onTakeImage: (image) {
            // TODO: download avatar from url and handle show
            print('image ${image?.path}');
            if (image?.path != null) {
              personalInfoBloc.add(UpdateAvatarEvent(image!.path));
            }
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
