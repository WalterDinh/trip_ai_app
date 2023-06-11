import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_app/states/search/search_bloc.dart';

class SearchStateSelector<T> extends BlocSelector<SearchBloc, SearchState, T> {
  SearchStateSelector({
    required T Function(SearchState) selector,
    required Widget Function(T) builder,
  }) : super(
          selector: selector,
          builder: (_, value) => builder(value),
        );
}

class FolderDetailManagerStatusSelector
    extends SearchStateSelector<SearchStateStatus> {
  FolderDetailManagerStatusSelector(Widget Function(SearchStateStatus) builder)
      : super(
          selector: (state) => state.status,
          builder: builder,
        );
}
