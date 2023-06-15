import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/configs/theme.dart';
import 'package:my_app/core/base/base_widget_screen_mixin.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/routes.dart';
import 'package:my_app/ui/screens/profile/sections/chart_statistic.dart';
import 'package:my_app/ui/screens/profile/sections/list_favorite_place.dart';
import 'package:my_app/ui/screens/profile/widgets/card_statistic.dart';
import 'package:my_app/ui/widgets/cache_image.dart';
import 'package:my_app/ui/widgets/ripple.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with BaseState {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    double chartHeight = 170;

    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const VSpacer(24),
            _buildPersonalInfoContainer(),
            // _buildRowAddFriendAndFollow(),
            const VSpacer(16),
            const Text(
              'Thống kê du lịch của bạn',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const VSpacer(16),
            Container(
              height: chartHeight,
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: ChartStatistic(),
            ),
            const VSpacer(24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: _statisticCardsRowTop(),
            ),
            const VSpacer(14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: _statisticCardsRowBottom(),
            ),
            const VSpacer(40),
            const SizedBox(
              height: 320,
              child: ListFavoritePlace(),
            ),
            VSpacer(MediaQuery.of(context).padding.bottom)
          ],
        ),
      ),
    );
  }

  Row _statisticCardsRowTop() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Expanded(
          child:
              StatisticCard(text: '14 Thanh Pho', iconName: AppImages.cityIcon),
        ),
        HSpacer(16),
        Expanded(
          child: StatisticCard(
              text: '8 Quoc Gia', iconName: AppImages.countryIcon),
        ),
      ],
    );
  }

  Row _statisticCardsRowBottom() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Expanded(
          child:
              StatisticCard(text: '4000 Km', iconName: AppImages.distanceIcon),
        ),
        HSpacer(16),
        Expanded(
          child: StatisticCard(
              text: '5 Chuyen Di', iconName: AppImages.tripCountIcon),
        ),
      ],
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
          height: AppValues.height_40,
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
              const HSpacer(8),
              SvgPicture.asset(
                AppImages.outlineCheckIcon,
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
          height: AppValues.height_40,
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
              const HSpacer(8),
              SvgPicture.asset(
                AppImages.outlineAddIcon,
                width: AppValues.iconDefaultSize,
                height: AppValues.iconDefaultSize,
              )
            ],
          ),
        ));
  }

  Widget _buildPersonalInfoContainer() {
    double height = 210;

    return SizedBox(
      height: height,
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
        _personalInfoAvatar(),
        const VSpacer(14),
        const Text(
          'Nguyen Gnauq',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        const VSpacer(6),
        Text(
          'UX/UI Designer',
          style: TextThemeApp.bodySmallerText
              .copyWith(color: AppColors.itemHandleColor),
        ),
        const VSpacer(14),
        Ripple(
          onTap: () {
            AppNavigator.push(Routes.friends);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '1599 Following',
                style: TextThemeApp.bodySmallerText
                    .copyWith(color: AppColors.itemHandleColor),
              ),
              Text(
                '599 Follower',
                style: TextThemeApp.bodySmallerText
                    .copyWith(color: AppColors.itemHandleColor),
              ),
            ],
          ),
        )
      ],
    );
  }

  SizedBox _personalInfoAvatar() {
    double avatarSize = 88;

    return SizedBox(
      width: avatarSize,
      height: avatarSize,
      child: Ripple(
        onTap: () {
          AppNavigator.push(Routes.personal_info);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(avatarSize / 2),
          child: const CacheImage(
            fit: BoxFit.cover,
            path:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-qbCmdpCG8m5YwrGGHSvd0ghiNXAj-IOoiA&usqp=CAU',
          ),
        ),
      ),
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
