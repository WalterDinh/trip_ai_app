import 'package:flutter/material.dart';
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
      children: const [
        Expanded(
          child: SizedBox(
            height: double.infinity,
            child: ItemMyTrip(),
          ),
        ),
        VSpacer(24)
      ],
    );
  }
}
