import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/ui/widgets/frosted_icon_button.dart';
import 'package:my_app/ui/widgets/ripple.dart';
import 'package:my_app/ui/widgets/spacer.dart';
import 'package:my_app/ui/widgets/trip/place_info_view.dart';

class ItemMyTrip extends StatelessWidget with BaseWidgetMixin {
  const ItemMyTrip({super.key, required this.image});

  final AssetImage image;

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [_geoPhoto(), _buttonActions(), _geoInfo(context)],
            ),
          ),
          const VSpacer(24),
          _placeName(),
          const VSpacer(8),
          // Align(
          //   alignment: AlignmentDirectional.centerEnd,
          //   child: _buttonRecreateTrip(),
          // )
        ],
      ),
    );
  }

  ClipRRect _geoPhoto() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppValues.largeRadius),
      child: Image(
        image: image,
        fit: BoxFit.cover,
      ),
    );
  }

  Ripple _buttonRecreateTrip() {
    return Ripple(
      onTap: null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.darkGreen,
          borderRadius: BorderRadius.circular(6),
        ),
        child: const Text(
          'Tạo lại chuyến',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _placeName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Landmark81',
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 28,
                  height: 1,
                  fontWeight: FontWeight.w500),
            ),
            Text('#ChuaHoanThanh',
                style: TextStyle(
                    color: AppColors.grey800,
                    fontSize: 12,
                    height: 1,
                    fontWeight: FontWeight.w500)),
          ],
        ),
        Row(
          children: const [
            Icon(Icons.star, color: AppColors.yellow),
            HSpacer(4),
            Text('4.9/5',
                style: TextStyle(
                    color: AppColors.grey800,
                    fontSize: 16,
                    fontWeight: FontWeight.w400))
          ],
        )
      ],
    );
  }

  Widget _geoInfo(context) {
    return Positioned(bottom: 10, left: 10, right: 10, child: PlaceInfoView());
  }

  Widget _buttonActions() {
    double margin = 20;

    return Positioned(
      top: margin,
      right: margin,
      child: Column(
        children: const [
          FrostedIconButton(icon: AppImages.heartIcon),
          VSpacer(12),
          FrostedIconButton(icon: AppImages.shareIcon),
          VSpacer(12),
          FrostedIconButton(icon: AppImages.addUserIcon),
        ],
      ),
    );
  }
}
