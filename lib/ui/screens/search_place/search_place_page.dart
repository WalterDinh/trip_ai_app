import 'dart:async';

import 'package:flutter/material.dart';

import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/base/base_widget_screen_mixin.dart';
import 'package:my_app/core/values/app_values.dart';

class SearchPlaceScreen extends StatefulWidget {
  const SearchPlaceScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SearchPlaceScreenState();
}

class _SearchPlaceScreenState extends State<SearchPlaceScreen> with BaseState {
  TextEditingController controller = TextEditingController();
  String textSearch = '';
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
  }

  _handleSearch(String text) {
    setState(() {
      textSearch = text;
    });
    if (text.isNotEmpty && text.length >= 2) {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 500), () {
        return;
      });
    }
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppValues.extraLargePadding),
          child: TextField(
            controller: controller,
            enabled: true,
            onChanged: _handleSearch,
            decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColors.textHintColorGrey),
                prefixIcon:
                    Icon(Icons.search, color: Theme.of(context).primaryColor),
                contentPadding: const EdgeInsets.all(14),
                fillColor: AppColors.backgroundTextFieldOpacity,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.0),
                ),
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1.0),
                )),
          ),
        ),
      ],
    );
  }
}
