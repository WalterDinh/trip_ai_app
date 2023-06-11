part of 'more_trip.dart';

class UpcomingTripPage extends StatefulWidget {
  const UpcomingTripPage({Key? key}) : super(key: key);

  @override
  State<UpcomingTripPage> createState() => _UpcomingTripScreenState();
}

class _UpcomingTripScreenState extends State<UpcomingTripPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) {
          return ItemMoreTrip(image: images[index]);
        },
        separatorBuilder: (context, index) {
          return const VSpacer(12);
        },
        itemCount: images.length);
  }
}

final List<AssetImage> images = [
  AppImages.introduction1,
  AppImages.introduction2,
  AppImages.introduction1,
  AppImages.introduction3,
  AppImages.introduction2,
  AppImages.introduction1,
  AppImages.introduction3,
  AppImages.introduction2,
];
