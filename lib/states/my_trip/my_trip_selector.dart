import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/states/my_trip/my_trip_bloc.dart';

class MyTripSelector<T> extends BlocSelector<MyTripBloc, MyTripState, T> {
  MyTripSelector({
    required T Function(MyTripState) selector,
    required Widget Function(T) builder,
  }) : super(
          selector: selector,
          builder: (_, value) => builder(value),
        );
}

class UpcomingTripSelector extends MyTripSelector<List<dynamic>?> {
  UpcomingTripSelector(Widget Function(List<dynamic>?) builder)
      : super(
          selector: (state) => state.listUpcomingTrip,
          builder: builder,
        );
}

class OldTripSelector extends MyTripSelector<List<dynamic>?> {
  OldTripSelector(Widget Function(List<dynamic>?) builder)
      : super(
          selector: (state) => state.listOldTrip,
          builder: builder,
        );
}
