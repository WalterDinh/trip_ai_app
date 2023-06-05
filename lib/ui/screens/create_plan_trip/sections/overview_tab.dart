import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/extensions/extension.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/ui/widgets/cache_image.dart';
import 'package:my_app/ui/widgets/ripple.dart';

List<String> items = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwhXMb64tBUSdWO9On_KzwF-HByBM3VjrBkg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwhXMb64tBUSdWO9On_KzwF-HByBM3VjrBkg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwhXMb64tBUSdWO9On_KzwF-HByBM3VjrBkg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwhXMb64tBUSdWO9On_KzwF-HByBM3VjrBkg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwhXMb64tBUSdWO9On_KzwF-HByBM3VjrBkg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwhXMb64tBUSdWO9On_KzwF-HByBM3VjrBkg&usqp=CAU",
];

class OverViewTab extends StatelessWidget {
  final double paddingBottom;

  const OverViewTab({Key? key, required this.paddingBottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double paddingBottom = MediaQuery.of(context).padding.bottom + 64;

    return CustomScrollView(primary: true, slivers: <Widget>[
      SliverToBoxAdapter(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                  'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.'),
            ),
            basicInfo(context),
            activity(context),
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
              '\$700',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            _itemLeftBasicInfo(context),
          ],
        ));
  }

  Widget activity(BuildContext context) {
    return SizedBox(
      height: 408,
      child: MasonryGridView.count(
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
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
            height: index % 2 == 0 ? 200 : 150,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(AppValues.radius_12)),
                child: CacheImage(fit: BoxFit.cover, path: items[index]))),
        Visibility(
            visible: index == 2,
            child: Positioned(
                child: Container(
              width: double.infinity,
              height: 200,
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
          children: const [
            Icon(
              Icons.calendar_month_rounded,
              color: AppColors.whiteGrey,
            ),
            SizedBox(
              width: AppValues.padding_4,
            ),
            Text(
              '5 Days',
              style: TextStyle(color: AppColors.whiteGrey),
            )
          ],
        ),
        Row(
          children: const [
            Icon(
              Icons.location_city,
              color: AppColors.whiteGrey,
            ),
            SizedBox(
              width: AppValues.padding_4,
            ),
            Text(
              '2 Cities',
              style: TextStyle(color: AppColors.whiteGrey),
            )
          ],
        )
      ]),
    );
  }
}
