import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/ui/screens/personal_info/widgets/item_info.dart';
import 'package:my_app/ui/widgets/cache_image.dart';
import 'package:my_app/ui/widgets/elevated_container.dart';
import 'package:my_app/ui/widgets/main_app_bar.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _personalInfoContainer(),
            const VSpacer(24),
            _personalInfo1(),
            const VSpacer(16),
            _personalInfo2(),
            const VSpacer(16),
            VSpacer(MediaQuery.of(context).padding.bottom)
          ],
        ),
      ),
    );
  }

  Widget _personalInfoContainer() {
    return SizedBox(
      height: 210,
      child: Stack(fit: StackFit.expand, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: _personalInfoBackdrop(),
        ),
        _personalInfo(),
      ]),
    );
  }

  Widget _personalInfo() {
    return Column(
      children: [
        const VSpacer(24),
        SizedBox(
          width: 88,
          height: 88,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(44),
            child: const CacheImage(
              fit: BoxFit.cover,
              path:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU',
            ),
          ),
        ),
        const VSpacer(14),
        const Text(
          'Nguyen Gnauq',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        const VSpacer(6),
        Text(
          'UX/UI Designer',
          style: TextStyle(
              color: Colors.grey.shade300,
              fontWeight: FontWeight.w400,
              fontSize: 12),
        ),
        const VSpacer(14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '1599 Following',
              style: TextStyle(
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
            Text(
              '599 Follower',
              style: TextStyle(
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          ],
        )
      ],
    );
  }

  Widget _personalInfoBackdrop() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: const Image(
          image: AppImages.introduction2,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _personalInfo1() {
    return ElevatedContainer(
      bgColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: const [
          ItemInfo(label: 'Số điện thoại', content: '0987654321'),
          Divider(height: 1, color: AppColors.itemHandleColor),
          ItemInfo(label: 'Email', content: 'email@email.com'),
          Divider(height: 1, color: AppColors.itemHandleColor),
          ItemInfo(label: 'Giới tính', content: 'Nam'),
        ],
      ),
    );
  }

  Widget _personalInfo2() {
    return ElevatedContainer(
      bgColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: const [
          ItemInfo(label: 'Quốc gia', content: 'Việt Nam'),
          Divider(height: 1, color: AppColors.itemHandleColor),
          ItemInfo(label: 'Tiền tệ', content: 'VND'),
          Divider(height: 1, color: AppColors.itemHandleColor),
          ItemInfo(label: 'Trình độ', content: 'Chuyên gia'),
          Divider(height: 1, color: AppColors.itemHandleColor),
          ItemInfo(label: 'Thể lực', content: 'Tốt'),
        ],
      ),
    );
  }
}
