import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/domain/entities/notification.dart';
import 'package:stream_transform/stream_transform.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  static const int photoPerPage = 60;

  NotificationBloc() : super(const NotificationState.initial()) {
    on<NotificationLoadEvent>(_onLoad,
        transformer: (events, mapper) => events.switchMap(mapper));
    on<NotificationLoadMoreEvent>(
      _onLoadMore,
      transformer: (events, mapper) => events.switchMap(mapper),
    );on<NotificationDeleteEvent>(
      _onDelete,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
  }

  void _onLoad(NotificationLoadEvent event,
      Emitter<NotificationState> emit) async {
    try {
      emit(state.asLoading());

      String dummyUrl =
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU';

      List<NotificationEntity> notifications = [];
      for (int i = 0; i < 10; i++) {
        notifications.add(NotificationEntity(
            title: 'Recent tweet from Jack Lemmon',
            content: 'Content',
            url: dummyUrl));
      }

      bool canLoadMore = notifications.length == photoPerPage;
      emit(state.asLoadSuccess(notifications, canLoadMore: canLoadMore));
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }

  void _onLoadMore(NotificationLoadMoreEvent event,
      Emitter<NotificationState> emit) async {
    try {
      if (!state.canLoadMore) return;

      emit(state.asLoadingMore());
      List<NotificationEntity> notifications = [];
      bool canLoadMore = notifications.length == photoPerPage;
      emit(state.asLoadMoreSuccess(notifications, canLoadMore: canLoadMore));
    } on Exception catch (e) {
      emit(state.asLoadMoreFailure(e));
    }
  }

  void _onDelete(NotificationDeleteEvent event, Emitter<NotificationState> emit) {
    // TODO: delete notification
  }
}
