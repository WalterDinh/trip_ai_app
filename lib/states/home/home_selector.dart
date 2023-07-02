import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Home/home_bloc.dart';

class HomeStateSelector<T> extends BlocSelector<HomeBloc, HomeState, T> {
  HomeStateSelector({
    required T Function(HomeState) selector,
    required Widget Function(T) builder,
  }) : super(
          selector: selector,
          builder: (_, value) => builder(value),
        );
}

class RecommendSelector extends HomeStateSelector<List<dynamic>?> {
  RecommendSelector(Widget Function(List<dynamic>?) builder)
      : super(
          selector: (state) => state.listRecommendTrip,
          builder: builder,
        );
}

class CategorySelector extends HomeStateSelector<List<dynamic>?> {
  CategorySelector(Widget Function(List<dynamic>?) builder)
      : super(
          selector: (state) => state.listCategory,
          builder: builder,
        );
}
