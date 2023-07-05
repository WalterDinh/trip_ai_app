import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/core/base/base_widget_screen_mixin.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/domain/entities/notification.dart';
import 'package:my_app/states/notification/notification_bloc.dart';
import 'package:my_app/ui/widgets/cache_image.dart';
import 'package:my_app/ui/widgets/frosted_icon_button.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class NotificationDetailScreen extends StatefulWidget {
  const NotificationDetailScreen({Key? key}) : super(key: key);

  @override
  State<NotificationDetailScreen> createState() =>
      _NotificationDetailScreenState();
}

class _NotificationDetailScreenState extends State<NotificationDetailScreen>
    with BaseState {
  NotificationBloc get notificationBloc => context.read<NotificationBloc>();

  @override
  Widget body(BuildContext context) {
    final notification = notificationBloc.state.selectedNotification;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTopImage(),
                const VSpacer(24),
                _buildPeopleAction(notification),
                const VSpacer(24),
                Text(notification?.title ?? ""),
                const VSpacer(14),
                const Text(
                  "Recent tweet from Jack Lemmon Nulla Lorem mollit cupidatat irure. "
                  "Laborum magna nulla duis ullamco cillum dolor. "
                  "Voluptate exercitation incididunt aliquip deserunt reprehenderit elit laborum. "
                  "Aliqua id fugiat nostrud irure ex duis ea quis id quis ad et. "
                  "Sunt qui esse pariatur duis deserunt mollit dolore cillum minim tempor enim. "
                  "Elit aute irure tempor cupidatat incididunt sint deserunt ut voluptate aute id deserunt nisi. "
                  "Aliqua id fugiat nostrud irure ex duis ea quis id quis ad et. "
                  "Sunt qui esse pariatur duis deserunt mollit dolore cillum minim tempor enim. "
                  "Recent tweet from Jack Lemmon Nulla Lorem mollit cupidatat irure. "
                  "Laborum magna nulla duis ullamco cillum dolor. "
                  "Voluptate exercitation incididunt aliquip deserunt reprehenderit elit laborum. "
                  "Aliqua id fugiat nostrud irure ex duis ea quis id quis ad et. "
                  "Sunt qui esse pariatur duis deserunt mollit dolore cillum minim tempor enim. "
                  "Elit aute irure tempor cupidatat incididunt sint deserunt ut voluptate aute id deserunt nisi. "
                  "Aliqua id fugiat nostrud irure ex duis ea quis id quis ad et. "
                  "Sunt qui esse pariatur duis deserunt mollit dolore cillum minim tempor enim.",
                  style: TextStyle(color: Color(0xFF828282)),
                ),
                const VSpacer(72)
              ],
            ),
          ),
        ),
      ]),
    );
  }

  @override
  Widget bottomNavigationBar() {
    return Container(
      margin: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          FrostedIconButton(icon: AppImages.addIcon),
          HSpacer(16),
          FrostedIconButton(icon: AppImages.heartIcon),
          HSpacer(16),
          FrostedIconButton(icon: AppImages.shareIcon),
        ],
      ),
    );
  }

  @override
  bool pageExtendBody() {
    return true;
  }

  Widget _buildPeopleAction(NotificationEntity? notification) {
    return Row(
      children: [
        SizedBox(
          width: 32,
          height: 32,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(AppValues.radius)),
            child: CacheImage(
              fit: BoxFit.cover,
              path: notification?.url ?? "",
            ),
          ),
        ),
        const HSpacer(8),
        SizedBox(
          width: 32,
          height: 32,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(AppValues.radius)),
            child: CacheImage(
              fit: BoxFit.cover,
              path: notification?.url ?? "",
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTopImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: const Image(
        image: AppImages.introduction1,
        fit: BoxFit.cover,
        height: 234,
        width: double.infinity,
      ),
    );
  }
}
