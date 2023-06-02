import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/ui/screens/profile/sections/statistic_chart.dart';
import 'package:my_app/ui/screens/profile/widgets/place_item2.dart';
import 'package:my_app/ui/screens/profile/widgets/statistic_card.dart';
import 'package:my_app/ui/widgets/cache_image.dart';
import 'package:my_app/ui/widgets/main_app_bar.dart';
import 'package:my_app/ui/widgets/ripple.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildPersonalInfoContainer(),
            _buildRowAddFriendAndFollow(),
            const VSpacer(16),
            const Text(
              'Thống kê du lịch của bạn',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const VSpacer(16),
            Container(
              height: 170,
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: StatisticChart(),
            ),
            const VSpacer(24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: StatisticCard(
                        text: '14 Thanh Pho', iconName: AppImages.addIcon),
                  ),
                  HSpacer(16),
                  Expanded(
                    child: StatisticCard(
                        text: '8 Quoc Gia', iconName: AppImages.addIcon),
                  ),
                ],
              ),
            ),
            const VSpacer(14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: StatisticCard(
                        text: '4000 Km', iconName: AppImages.addIcon),
                  ),
                  HSpacer(16),
                  Expanded(
                    child: StatisticCard(
                        text: '5 Chuyen Di', iconName: AppImages.addIcon),
                  ),
                ],
              ),
            ),
            const VSpacer(40),
            SizedBox(
              height: 320,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return PlaceItem2(
                    onTab: () {
                      return;
                    },
                    listAvatar: const [
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU",
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU",
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU",
                    ],
                    path:
                        'https://www.studytienganh.vn/upload/2021/05/99552.jpeg',
                    locationName: 'Trang An, Ninh Binh',
                    placeName: 'Ninh Binh',
                  );
                },
                separatorBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(left: 24),
                  );
                },
              ),
            ),
            VSpacer(MediaQuery.of(context).padding.bottom)
          ],
        ),
      ),
    );
  }

  Widget _buildRowAddFriendAndFollow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: _buildButtonAddFriend(),
          ),
          const HSpacer(16),
          Expanded(
            child: _buildButtonFollow(),
          )
        ],
      ),
    );
  }

  Widget _buildButtonFollow() {
    return Ripple(
        onTap: null,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.darkGreen),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Theo dõi',
                style: TextStyle(
                    color: AppColors.darkGreen, fontWeight: FontWeight.w400),
              ),
              SvgPicture.asset(
                AppImages.addIcon,
                color: AppColors.darkGreen,
                width: AppValues.iconDefaultSize,
                height: AppValues.iconDefaultSize,
              )
            ],
          ),
        ));
  }

  Widget _buildButtonAddFriend() {
    return Ripple(
        onTap: null,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              color: AppColors.darkGreen,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Thêm bạn bè',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
              ),
              SvgPicture.asset(
                AppImages.addIcon,
                width: AppValues.iconDefaultSize,
                height: AppValues.iconDefaultSize,
              )
            ],
          ),
        ));
  }

  Widget _buildPersonalInfoContainer() {
    return SizedBox(
      height: 210,
      child: Stack(fit: StackFit.expand, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: _buildPersonalInfoBackdrop(),
        ),
        _buildPersonalInfo(),
      ]),
    );
  }

  Widget _buildPersonalInfo() {
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

  Widget _buildPersonalInfoBackdrop() {
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
}
