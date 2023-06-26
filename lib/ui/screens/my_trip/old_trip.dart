import 'package:flutter/material.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/routes.dart';
import 'package:my_app/ui/screens/my_trip/widgets/item_more_trip.dart';
import 'package:my_app/ui/widgets/ripple.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class OldTripPage extends StatefulWidget {
  const OldTripPage({Key? key}) : super(key: key);

  @override
  State<OldTripPage> createState() => _OldTripScreenState();
}

class _OldTripScreenState extends State<OldTripPage> {
  void onNavigateToDetail(int id) {
    AppNavigator.push(Routes.detail_trip, DetailTripType.past_trip);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.fromLTRB(
            16, 8, 16, MediaQuery.of(context).padding.bottom),
        itemBuilder: (context, index) {
          return Ripple(
              onTap: () => onNavigateToDetail(0),
              child: ItemMoreTrip(image: oldTripImages[index]));
        },
        separatorBuilder: (context, index) {
          return const VSpacer(12);
        },
        itemCount: oldTripImages.length);
  }
}

final List<AssetImage> oldTripImages = [
  AppImages.introduction3,
  AppImages.introduction1,
  AppImages.introduction3,
  AppImages.introduction2,
  AppImages.introduction2,
  AppImages.introduction1,
  AppImages.introduction2,
  AppImages.introduction1,
];
