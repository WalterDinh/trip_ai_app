import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/ui/widgets/cache_image.dart';
import 'package:my_app/ui/widgets/ripple.dart';
import 'package:my_app/ui/widgets/spacer.dart';

List<String> items = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwhXMb64tBUSdWO9On_KzwF-HByBM3VjrBkg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwhXMb64tBUSdWO9On_KzwF-HByBM3VjrBkg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwhXMb64tBUSdWO9On_KzwF-HByBM3VjrBkg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwhXMb64tBUSdWO9On_KzwF-HByBM3VjrBkg&usqp=CAU",
];

class OverViewTab extends StatelessWidget {
  const OverViewTab(
      {Key? key,
      required this.content,
      required this.budget,
      required this.totalCity,
      required this.totalDays,
      this.listPhoto})
      : super(key: key);

  final String content;
  final String budget;
  final int totalCity;
  final int totalDays;
  final List<String>? listPhoto;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(primary: true, slivers: <Widget>[
      SliverToBoxAdapter(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            Center(
              child: Text(content),
            ),
            basicInfo(context),
            photos(context),
          ],
        ),
      ))
    ]);
  }

  Widget basicInfo(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$$budget',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            _itemLeftBasicInfo(context),
          ],
        ));
  }

  Widget photos(BuildContext context) {
    double listImageHeight = 380;

    return SizedBox(
      height: listImageHeight,
      child: MasonryGridView.count(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: items.length,
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 8,
        itemBuilder: (context, index) {
          return Ripple(
              onTap: () {
                return;
              },
              child: itemPhoto(context, index));
        },
      ),
    );
  }

  Widget itemPhoto(BuildContext context, int index) {
    double smallImageHeight = 150;
    double bigImageHeight = 200;

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
            height: index % 2 == 0 ? bigImageHeight : smallImageHeight,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(AppValues.radius_12)),
                child: CacheImage(fit: BoxFit.cover, path: items[index]))),
        Visibility(
            visible: index == 2,
            child: Positioned(
                child: Container(
              width: double.infinity,
              height: bigImageHeight,
              decoration: BoxDecoration(
                  color: AppColors.backgroundBlackOpacity200,
                  borderRadius: const BorderRadius.all(
                      Radius.circular(AppValues.radius_12))),
            ))),
        Visibility(
          visible: index == 2,
          child: Positioned(
            child: Text(
              '+3',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  Widget _itemLeftBasicInfo(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(24.0))),
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            const Icon(
              Icons.calendar_month_rounded,
              color: AppColors.whiteGrey,
            ),
            const HSpacer(AppValues.padding_4),
            Text(
              '$totalDays Days',
              style: const TextStyle(color: AppColors.whiteGrey),
            )
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.location_city,
              color: AppColors.whiteGrey,
            ),
            const HSpacer(AppValues.padding_4),
            Text(
              '$totalCity Cities',
              style: const TextStyle(color: AppColors.whiteGrey),
            )
          ],
        )
      ]),
    );
  }
}
