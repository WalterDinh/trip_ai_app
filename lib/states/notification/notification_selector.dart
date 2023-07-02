import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/domain/entities/notification.dart';
import 'package:my_app/states/notification/notification_bloc.dart';

class NotificationSelector<T>
    extends BlocSelector<NotificationBloc, NotificationState, T> {
  NotificationSelector({
    required T Function(NotificationState) selector,
    required Widget Function(T) builder,
  }) : super(
          selector: selector,
          builder: (_, value) => builder(value),
        );
}

class NotificationStateStatusSelector
    extends NotificationSelector<NotificationStateStatus> {
  NotificationStateStatusSelector(
      Widget Function(NotificationStateStatus) builder)
      : super(
          selector: (state) => state.status,
          builder: builder,
        );
}

class NotificationCanLoadMoreSelector extends NotificationSelector<bool> {
  NotificationCanLoadMoreSelector(Widget Function(bool) builder)
      : super(
          selector: (state) => state.canLoadMore,
          builder: builder,
        );
}

class NotificationsSelector
    extends NotificationSelector<List<NotificationEntity>> {
  NotificationsSelector(Widget Function(List<NotificationEntity>) builder)
      : super(
          selector: (state) => state.notificationList,
          builder: builder,
        );
}
