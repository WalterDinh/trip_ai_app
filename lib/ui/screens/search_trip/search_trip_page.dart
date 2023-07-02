import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/core/base/base_widget_screen_mixin.dart';
import 'package:my_app/core/values/app_values.dart';

import 'package:my_app/states/search/search_bloc.dart';
import 'package:my_app/ui/widgets/input_search.dart';

import 'package:my_app/ui/widgets/spacer.dart';

import 'widgets/item_result_search.dart';

part 'sections/empty_data_search.dart';
part 'sections/result_search.dart';
part 'sections/default_search_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
        create: (context) => SearchBloc(), child: const SearchView());
  }
}

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<StatefulWidget> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> with BaseState {
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
            child: InputSearch(
              controller: controller,
              handleSearch: _handleSearch,
            )),
        BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
          return const ResultSearch(
            data: [1, 2, 3, 4],
          );

          if (state.status == SearchStateStatus.loading ||
              textSearch != controller.text) {
            return const Text('Loading');
          }

          if (state.listRecent.isEmpty && textSearch == '') {
            return DefaultSearchView(context: context);
          }

          if (state.listTripDataSearch.isEmpty &&
              state.listTripDataSearch.isEmpty) {
            return EmptyDataSearch(context: context);
          }
        })
      ],
    );
  }
}
