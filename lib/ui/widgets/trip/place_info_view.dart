import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/configs/theme.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class PlaceInfoView extends StatelessWidget with BaseWidgetMixin {
  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        _backdropGeoInfo(),
        Positioned.fill(
          child: Row(
            children: [
              Expanded(child: _colItem(context, 'Location', 'Vietnam')),
              _colFlightRest(context),
              Expanded(child: _colItem(context, 'Destination', 'LandMark81'))
            ],
          ),
        )
      ],
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
          child: _colItem(context, 'Flight Rest', 'SaiGon')),
    );
  }

  Widget _colItem(BuildContext context, String title, String content) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title,
            style: TextThemeApp.bodySmallerText
                .copyWith(color: AppColors.itemHandleColor)),
        const VSpacer(4),
        Text(content,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w400)),
      ],
    );
  }

  ClipRRect _backdropGeoInfo() {
    double height = 76;

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
          height: height,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
        ),
      ),
    );
  }
}
