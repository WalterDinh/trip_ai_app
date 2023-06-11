import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/core/base/base_widget_screen_mixin.dart';
import 'package:my_app/routes.dart';
import 'package:my_app/ui/widgets/ripple.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with BaseState {
  late SwipeActionController controller;
  List<int> notifications = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  void initState() {
    super.initState();
    controller = SwipeActionController();
  }

  @override
  Widget screenName() {
    return const Text("Notifications");
  }

  @override
  Widget body(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => _buildNotificationItem(index),
      itemCount: notifications.length,
    );
  }

  Widget _buildNotificationContent(String url) {
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
          controller.closeAllOpenCell();
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
                    backgroundImage: NetworkImage(url),
                    radius: 16,
                  ),
                  const HSpacer(8),
                  CircleAvatar(
                    backgroundImage: NetworkImage(url),
                    radius: 16,
                  )
                ],
              ),
              const VSpacer(8),
              const Text('Recent tweet from Jack Lemmon')
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationItem(int index) {
    return SwipeActionCell(
      backgroundColor: Colors.transparent,
      closeWhenScrolling: true,
      controller: controller,
      key: ValueKey(notifications[index]),
      trailingActions: _buildNotificationActions(index),
      child: _buildNotificationContent(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU'),
    );
  }

  List<SwipeAction> _buildNotificationActions(int index) {
    return [
      SwipeAction(
          color: Colors.transparent,
          widthSpace: 98,
          content:
              _buildActionButton(const Color(0xFFEB5757), AppImages.deleteIcon),
          onTap: (handler) async {
            // await handler(true);
            notifications.removeAt(index);
            setState(() {
              return;
            });
          }),
    ];
  }

  Widget _buildActionButton(color, icon) {
    return Ripple(
      onTap: null,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(right: 30),
        width: 68,
        height: 68,
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
