import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/ui/widgets/cache_image.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
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
                        "Sunt qui esse pariatur duis deserunt mollit dolore cillum minim tempor enim.",
                    style: TextStyle(color: Color(0xFF828282)),),
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
                  _buildActionButton(const Color(0xFFE5E5E5), AppImages.addIcon),
                  const HSpacer(16),
                  _buildActionButton(
                      const Color(0xFFE5E5E5), AppImages.heartIcon),
                  const HSpacer(16),
                  _buildActionButton(const Color(0xFFE5E5E5), AppImages.shareIcon),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(color, String icon) {
    return Ripple(
      onTap: () {
        return;
      },
      child: Container(
        width: 44,
        height: 44,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }

  Widget _buildPeopleAction() {
    return Row(
      children: const [
        SizedBox(
          width: 32,
          height: 32,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
                Radius.circular(AppValues.radius)),
            child: CacheImage(
              fit: BoxFit.cover,
              path: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU',
            ),
          ),
        ),
        HSpacer(8),
        SizedBox(
          width: 32,
          height: 32,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
                Radius.circular(AppValues.radius)),
            child: CacheImage(
              fit: BoxFit.cover,
              path: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU',
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
