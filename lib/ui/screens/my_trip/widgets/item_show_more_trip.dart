import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/ui/widgets/ripple.dart';

class ItemShowMoreTrip extends StatelessWidget with BaseWidgetMixin {
  final AssetImage image;
  final Function()? onTap;

  const ItemShowMoreTrip({Key? key, required this.image, this.onTap}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [_photo(), _info(context)],
            ),
          ),
        ],
      ),
    );
  }

  ClipRRect _photo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppValues.largeRadius),
      child: Image(
        image: image,
        fit: BoxFit.cover,
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
          Positioned.fill(
            child: Ripple(
              onTap: onTap,
              child: Center(
                child: Text(
                  'Xem thêm',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  ClipRRect _backdrop() {
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
