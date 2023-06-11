import 'package:flutter/material.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/core/base/base_widget_screen_mixin.dart';
import 'package:my_app/core/values/app_values.dart';
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
  @override
  Widget body(BuildContext context) {
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
                _buildPeopleAction(),
                const VSpacer(24),
                const Text('Recent tweet from Jack Lemmon'),
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

  Widget _buildPeopleAction() {
    return Row(
      children: const [
        SizedBox(
          width: 32,
          height: 32,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(AppValues.radius)),
            child: CacheImage(
              fit: BoxFit.cover,
              path:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU',
            ),
          ),
        ),
        HSpacer(8),
        SizedBox(
          width: 32,
          height: 32,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(AppValues.radius)),
            child: CacheImage(
              fit: BoxFit.cover,
              path:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU',
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
