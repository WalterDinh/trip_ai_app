import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/configs/theme.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/ui/widgets/ripple.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class ItemMyTrip extends StatelessWidget with BaseWidgetMixin {
  const ItemMyTrip({
    super.key,
  });

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: const Image(
                    image: AppImages.introduction2,
                    fit: BoxFit.cover,
                  ),
                ),
                _geoInfo(context)
              ],
            ),
          ),
          const VSpacer(24),
          _placeName(),
          const VSpacer(8),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: _buttonRecreateTrip(),
          )
        ],
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
    return Positioned(
      bottom: 10,
      left: 10,
      right: 10,
      child: Stack(
        children: [
          _backdropGeoInfo(),
          Positioned.fill(
            child: Row(
              children: [
                _colLocation(context),
                _colFlightRest(context),
                _colDestination(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _colDestination(context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Destination',
              style: TextThemeApp.bodySmallerText
                  .copyWith(color: AppColors.itemHandleColor)),
          const VSpacer(4),
          Text('Landmark 81',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _colFlightRest(context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(color: Colors.white, width: 1),
            right: BorderSide(color: Colors.white, width: 1),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flight Rest',
                style: TextThemeApp.bodySmallerText
                    .copyWith(color: AppColors.itemHandleColor)),
            const VSpacer(4),
            Text('Sai Gon',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _colLocation(context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Location',
              style: TextThemeApp.bodySmallerText
                  .copyWith(color: AppColors.itemHandleColor)),
          const VSpacer(4),
          Text('VietNam',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white)),
        ],
      ),
    );
  }

  ClipRRect _backdropGeoInfo() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          height: 76,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
        ),
      ),
    );
  }
}
