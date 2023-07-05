import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/core/base/base_widget_screen_mixin.dart';
import 'package:my_app/domain/entities/notification.dart';
import 'package:my_app/routes.dart';
import 'package:my_app/states/notification/notification_bloc.dart';
import 'package:my_app/states/notification/notification_selector.dart';
import 'package:my_app/ui/widgets/ripple.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with BaseState {
  static const double _endReachedThreshold = 200;

  late SwipeActionController _swipeActionController;
  final ScrollController _scrollController = ScrollController();

  NotificationBloc get notificationBloc => context.read<NotificationBloc>();

  @override
  void initState() {
    super.initState();
    _swipeActionController = SwipeActionController();
    scheduleMicrotask(() {
      _scrollController.addListener(_onScroll);

      notificationBloc.add(const NotificationLoadEvent());
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget screenName() {
    return const Text("Notifications");
  }

  void _onScroll() {
    final innerController = _scrollController;

    if (!innerController.hasClients) return;

    final extentAfter = innerController.position.extentAfter;

    final thresholdReached =
        extentAfter > 0 && extentAfter < _endReachedThreshold;

    if (thresholdReached) {
      notificationBloc.add(NotificationLoadMoreEvent());
    }
  }

  @override
  Widget body(BuildContext context) {
    // return NotificationStateStatusSelector((status) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        NotificationsSelector((notifications) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _buildNotificationItem(index, notifications[index]);
              },
              childCount: notifications.length,
            ),
          );
        }),
        SliverToBoxAdapter(
          child: NotificationCanLoadMoreSelector((canLoadMore) {
            if (!canLoadMore) {
              return const SizedBox.shrink();
            }

            return Container(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 28),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }),
        ),
        SliverToBoxAdapter(
            child: VSpacer(MediaQuery.of(context).padding.bottom)),
      ],
    );
    // });
  }

  Widget _buildNotificationContent(NotificationEntity notification) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(25, 0, 0, 0),
                blurRadius: 15,
                offset: Offset(0, 4))
          ]),
      child: Ripple(
        onTap: () {
          _swipeActionController.closeAllOpenCell();
          AppNavigator.push(Routes.notification_detail);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(notification.url),
                    radius: 16,
                  ),
                  const HSpacer(8),
                  CircleAvatar(
                    backgroundImage: NetworkImage(notification.url),
                    radius: 16,
                  )
                ],
              ),
              const VSpacer(8),
              Text(notification.title)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationItem(int index, NotificationEntity notification) {
    return SwipeActionCell(
        backgroundColor: Colors.transparent,
        closeWhenScrolling: true,
        controller: _swipeActionController,
        key: ValueKey(notification),
        trailingActions: _buildNotificationActions(index),
        child: _buildNotificationContent(notification));
  }

  List<SwipeAction> _buildNotificationActions(int index) {
    double widthSpace = 98;

    return [
      SwipeAction(
        color: Colors.transparent,
        widthSpace: widthSpace,
        content: _buildActionButton(AppColors.lightRed, AppImages.deleteIcon),
        onTap: (handler) async {
          // await handler(true);
          // notifications.removeAt(index);
          setState(() {
            return;
          });
        },
      ),
    ];
  }

  Widget _buildActionButton(color, icon) {
    double buttonSize = 68;

    return Ripple(
      onTap: null,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(right: 30),
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(35, 0, 0, 0),
                blurRadius: 15,
                offset: Offset(0, 4))
          ],
          color: color,
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
