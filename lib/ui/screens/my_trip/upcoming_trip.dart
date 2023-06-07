import 'package:flutter/material.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/ui/screens/my_trip/widgets/item_my_trip.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class UpcomingTripScreen extends StatefulWidget {
  const UpcomingTripScreen({Key? key}) : super(key: key);

  @override
  State<UpcomingTripScreen> createState() => _UpcomingTripScreenState();
}

class _UpcomingTripScreenState extends State<UpcomingTripScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            height: double.infinity,
            child: PageView.builder(
              controller: PageController(),
              itemCount: 5,
              itemBuilder: (context, index) {
              return ItemMyTrip(image: images[index]);
            },),
          ),
        ),
        const VSpacer(24)
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
