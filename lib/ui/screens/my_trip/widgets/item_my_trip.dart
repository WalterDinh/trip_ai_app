import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/configs/theme.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class ItemMyTrip extends StatelessWidget with BaseWidgetMixin {
  const ItemMyTrip({
    super.key,
  });

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
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
          _info(context)
        ],
      ),
    );
  }

  Widget _info(context) {
    return Positioned(
      bottom: 10,
      left: 10,
      right: 10,
      child: Stack(
        children: [
          _backdrop(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
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
      child: Column(
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
    );
  }

  Widget _colLocation(context) {
    return Expanded(
      child: Column(
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

  ClipRRect _backdrop() {
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
