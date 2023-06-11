import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/core/base/base_widget_screen_mixin.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/routes.dart';
import 'package:my_app/ui/widgets/cache_image.dart';

import 'package:my_app/ui/widgets/main_app_bar.dart';
import 'package:my_app/ui/widgets/spacer.dart';

import 'widgets/drop_down_language.dart';
import 'widgets/item_setting.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with BaseState {
  final double leadingWidth = 120;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _personalInfoAvatar(),
        ItemSetting(
            title: 'Language',
            rightView: const DropdownButtonLanguage(),
            onPress: () {
              return;
            }),
        ItemSetting(
            title: 'Password',
            onPress: () {
              return;
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
          child: Divider(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        ItemSetting(
            title: 'About Us',
            onPress: () {
              return;
            }),
        ItemSetting(
            title: 'FQA',
            onPress: () {
              return;
            }),
        ItemSetting(
            title: 'Term & Conditions',
            onPress: () {
              return;
            })
      ],
    );
  }

  @override
  Widget screenName() {
    return const Text("Settings");
  }

  @override
  Widget bottomNavigationBar() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppValues.largePadding),
        child: Container(
            margin: const EdgeInsets.only(bottom: 32.0),
            child: ElevatedButton(
                onPressed: () {
                  return;
                },
                child: const Text('Logout'))));
  }

  SizedBox _personalInfoAvatar() {
    return SizedBox(
      width: 88,
      height: 88,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(44),
        child: const CacheImage(
          fit: BoxFit.cover,
          path:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU',
        ),
      ),
    );
  }
}
