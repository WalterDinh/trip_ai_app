import 'package:flutter/material.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/routes.dart';
import 'package:my_app/ui/screens/my_trip/my_trip.dart';
import 'package:my_app/ui/screens/my_trip/widgets/item_show_more_trip.dart';
import 'package:my_app/ui/screens/my_trip/widgets/item_my_trip.dart';
import 'package:my_app/ui/widgets/ripple.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class UpcomingTripScreen extends StatefulWidget {
  const UpcomingTripScreen({Key? key}) : super(key: key);

  @override
  State<UpcomingTripScreen> createState() => _UpcomingTripScreenState();
}

class _UpcomingTripScreenState extends State<UpcomingTripScreen> {
  void onNavigateToDetail(int id) {
    AppNavigator.push(Routes.detail_trip, DetailTripType.upcoming_trip);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            height: double.infinity,
            child: PageView.builder(
              controller: PageController(),
              itemCount: images.length,
              itemBuilder: (context, index) {
                AssetImage image = images[index];

                return index > images.length - 2
                    ? ItemShowMoreTrip(
                        image: image,
                        onTap: () {
                          AppNavigator.push(
                              Routes.more_trip, MyTrip.upcoming_trip);
                        },
                      )
                    : Ripple(
                        onTap: () => onNavigateToDetail(0),
                        child: ItemMyTrip(image: image));
              },
            ),
          ),
        ),
        const VSpacer(24),
        VSpacer(MediaQuery.of(context).padding.bottom),
      ],
    );
  }
}

final List<AssetImage> images = [
  AppImages.introduction1,
  AppImages.introduction2,
  AppImages.introduction1,
  AppImages.introduction3,
  AppImages.introduction2,
];
