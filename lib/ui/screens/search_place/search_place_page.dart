import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/base/base_widget_screen_mixin.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/states/search_place/search_place_bloc.dart';
import 'package:my_app/ui/screens/search_place/widgets/item_search_place.dart';
import 'package:my_app/ui/widgets/input_search.dart';

part 'sections/list_success_place.dart';

class SearchPlaceScreen extends StatelessWidget {
  const SearchPlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchPlaceBloc>(
      create: (context) => SearchPlaceBloc(),
      child: const SearchPlaceView(),
    );
  }
}

class SearchPlaceView extends StatefulWidget {
  const SearchPlaceView({super.key});

  @override
  State<StatefulWidget> createState() => _SearchPlaceViewState();
}

class _SearchPlaceViewState extends State<SearchPlaceView> with BaseState {
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
          padding: const EdgeInsets.symmetric(horizontal: AppValues.padding),
          child: Row(
            children: [
              Expanded(
                  child: InputSearch(
                controller: controller,
                handleSearch: _handleSearch,
              )),
              IconButton(
                  onPressed: () {
                    return;
                  },
                  icon: const Icon(Icons.filter_list))
            ],
          ),
        ),
        ListSuccessPlace()
      ],
    );
  }
}
