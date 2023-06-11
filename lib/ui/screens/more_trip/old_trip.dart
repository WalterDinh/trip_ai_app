part of 'more_trip.dart';

class OldTripPage extends StatefulWidget {
  const OldTripPage({Key? key}) : super(key: key);

  @override
  State<OldTripPage> createState() => _OldTripScreenState();
}

class _OldTripScreenState extends State<OldTripPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) {
          return ItemMoreTrip(image: oldTripImages[index]);
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
