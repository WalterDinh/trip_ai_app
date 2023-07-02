part of 'notification_bloc.dart';

enum NotificationStateStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
  loadingMore,
  loadMoreSuccess,
  loadMoreFailure,
}

class NotificationState {
  final NotificationStateStatus status;
  final List<NotificationEntity> notificationList;
  final int page;
  final Exception? error;
  final bool canLoadMore;

  const NotificationState._(
      {this.status = NotificationStateStatus.initial,
      this.notificationList = const [],
      this.page = 0,
      this.error,
      this.canLoadMore = true});

  const NotificationState.initial() : this._();

  NotificationState asLoading() {
    return copyWith(
      status: NotificationStateStatus.loading,
    );
  }

  NotificationState asLoadSuccess(List<NotificationEntity> notificationList,
      {bool canLoadMore = true}) {
    return copyWith(
      status: NotificationStateStatus.loadSuccess,
      notificationList: notificationList,
      page: 1,
      canLoadMore: canLoadMore,
    );
  }

  NotificationState asLoadFailure(Exception e) {
    return copyWith(
      status: NotificationStateStatus.loadFailure,
      error: e,
    );
  }

  NotificationState asLoadingMore() {
    return copyWith(status: NotificationStateStatus.loadingMore);
  }

  NotificationState asLoadMoreSuccess(
      List<NotificationEntity> newNotificationList,
      {bool canLoadMore = true}) {
    return copyWith(
      status: NotificationStateStatus.loadMoreSuccess,
      notificationList: [...notificationList, ...newNotificationList],
      page: canLoadMore ? page + 1 : page,
      canLoadMore: canLoadMore,
    );
  }

  NotificationState asLoadMoreFailure(Exception e) {
    return copyWith(
      status: NotificationStateStatus.loadMoreFailure,
      error: e,
    );
  }

  NotificationState copyWith({
    NotificationStateStatus? status,
    List<NotificationEntity>? notificationList,
    final File? photoScan,
    int? page,
    bool? canLoadMore,
    Exception? error,
  }) {
    return NotificationState._(
      status: status ?? this.status,
      notificationList: notificationList ?? this.notificationList,
      page: page ?? this.page,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      error: error ?? this.error,
    );
  }
}
