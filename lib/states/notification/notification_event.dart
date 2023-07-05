part of 'notification_bloc.dart';

@immutable
abstract class NotificationEvent {
  const NotificationEvent();
}

class NotificationLoadEvent extends NotificationEvent {
  const NotificationLoadEvent();
}

class NotificationLoadMoreEvent extends NotificationEvent {}

class NotificationDeleteEvent extends NotificationEvent {
  final int index;

  const NotificationDeleteEvent(this.index);
}

class NotificationSelectEvent extends NotificationEvent {
  final NotificationEntity notification;

  const NotificationSelectEvent(this.notification);
}
