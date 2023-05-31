import 'package:flutter/material.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/ui/widgets/main_app_bar.dart';
import 'package:my_app/ui/widgets/ripple.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class NotificationDetailScreen extends StatefulWidget {
  const NotificationDetailScreen({Key? key}) : super(key: key);

  @override
  State<NotificationDetailScreen> createState() =>
      _NotificationDetailScreenState();
}

class _NotificationDetailScreenState extends State<NotificationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
                        "Sunt qui esse pariatur duis deserunt mollit dolore cillum minim tempor enim."),
                    const VSpacer(72)
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildActionButton(const Color(0xFFE5E5E5), Icons.add),
                  const HSpacer(16),
                  _buildActionButton(
                      const Color(0xFFE5E5E5), Icons.heart_broken),
                  const HSpacer(16),
                  _buildActionButton(const Color(0xFFE5E5E5), Icons.share),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(color, icon) {
    return Ripple(
      onTap: null,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildPeopleAction() {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://cdn.pixabay.com/photo/2019/04/19/13/44/john-snow-4139536_960_720.jpg'),
          radius: 16,
        ),
        const HSpacer(8),
        const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://cdn.pixabay.com/photo/2019/04/19/13/44/john-snow-4139536_960_720.jpg'),
          radius: 16,
        )
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
