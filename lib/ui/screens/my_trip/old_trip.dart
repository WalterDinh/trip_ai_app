import 'package:flutter/material.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/routes.dart';
import 'package:my_app/ui/screens/my_trip/my_trip.dart';
import 'package:my_app/ui/screens/my_trip/widgets/item_my_trip.dart';
import 'package:my_app/ui/screens/my_trip/widgets/item_show_more_trip.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class OldTripScreen extends StatefulWidget {
  const OldTripScreen({Key? key}) : super(key: key);

  @override
  State<OldTripScreen> createState() => _OldTripScreenState();
}

class _OldTripScreenState extends State<OldTripScreen> {
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
                    ? ItemShowMoreTrip(image: image, onTap: () {

                      AppNavigator.push(Routes.more_trip, MyTrip.old_trip);
                    },)
                    : ItemMyTrip(image: image);
              },
            ),
          ),
        ),
        const VSpacer(24)
      ],
    );
  }
}

final List<AssetImage> images = [
  AppImages.introduction2,
  AppImages.introduction3,
  AppImages.introduction2,
  AppImages.introduction1,
  AppImages.introduction1,
];
