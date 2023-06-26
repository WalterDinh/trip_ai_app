import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/core/base/base_widget_screen_mixin.dart';
import 'package:my_app/core/extensions/extension.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/routes.dart';
import 'package:my_app/ui/widgets/cache_image.dart';

import 'package:my_app/ui/widgets/main_app_bar.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class PlaceDetailScreen extends StatefulWidget {
  const PlaceDetailScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> with BaseState {
  final double leadingWidth = 120;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            placeContent(),
            const VSpacer(24),
            placeImage(),
            const VSpacer(24),
            placeInfo()
          ],
        ),
      ),
    );
  }

  Widget placeImage() {
    double widthImage = MediaQuery.of(context).size.width - 48;
    double heightImage = widthImage * 400 / 353;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: heightImage,
          width: widthImage,
          child: const ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(AppValues.radius_12),
            ),
            child: CacheImage(
              fit: BoxFit.cover,
              path:
                  'https://c8.alamy.com/comp/WG9GPP/small-coffee-shop-coffee-kyoto-japan-WG9GPP.jpg',
            ),
          ).fadeAnimation(0.5),
        )
      ],
    );
  }

  Widget placeInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim consequat duis enim velit mollit.',
            style: Theme.of(context).textTheme.bodySmall!),
        const VSpacer(16),
        Row(
          children: [
            const Icon(Icons.access_time_outlined),
            const HSpacer(8),
            Text(
              'Mon - Sta | 9:00 - 18:00',
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
        const VSpacer(4),
        Row(
          children: [
            const Icon(Icons.phone),
            const HSpacer(8),
            Text(
              '+84 09928839192',
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ],
    );
  }

  Widget placeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Highland Coffee',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const HSpacer(4),
            Row(
              children: const [
                Icon(
                  Icons.star,
                  color: AppColors.yellow,
                  size: AppValues.iconSize_20,
                ),
                Text('4,7')
              ],
            )
          ],
        ),
        const VSpacer(4),
        Text(
          '2RHG+MVH, Chợ Dừa, Đống Đa, Hà Nội, Việt Nam',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.grey800),
          maxLines: 2,
        ),
      ],
    );
  }

  @override
  Widget bottomNavigationBar() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppValues.largePadding),
        child: Container(
            margin: const EdgeInsets.only(bottom: 32.0),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: InkWell(
                    child: Text(
                      'View on map',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const Expanded(child: HSpacer(24)),
                ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 12)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ))),
                    onPressed: () {
                      return;
                    },
                    child: const Text('Add to plan'))
              ],
            )));
  }
}
