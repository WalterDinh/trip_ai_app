import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/ui/widgets/cache_image.dart';
import 'package:my_app/ui/widgets/ripple.dart';
import 'package:my_app/ui/widgets/spacer.dart';
import 'package:timelines/timelines.dart';

double heightImage = 100;
double widthImage = 80;

class TodoPlanTab extends StatefulWidget {
  const TodoPlanTab({Key? key, required this.paddingBottom}) : super(key: key);

  final double paddingBottom;

  @override
  State<TodoPlanTab> createState() => _TodoPlanTabState();
}

class _TodoPlanTabState extends State<TodoPlanTab>
    with SingleTickerProviderStateMixin {
  late TabController planTabController;

  @override
  void initState() {
    super.initState();
    planTabController = TabController(initialIndex: 0, length: 3, vsync: this);
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(),
        Expanded(
            child: TabBarView(
          controller: planTabController,
          children: const <Widget>[PlanTrip()],
        ))
      ],
    );
  }

  PreferredSizeWidget _buildTabBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TabBar(
            isScrollable: false,
            indicatorColor: Theme.of(context).primaryColor,
            controller: planTabController,
            labelColor: AppColors.darkGreen,
            unselectedLabelColor: AppColors.grey,
            splashBorderRadius: const BorderRadius.all(Radius.circular(14)),
            tabs: [
              const Tab(text: 'Day 1'),
              const Tab(text: 'Day 2'),
              const Tab(text: 'Day 3'),
              Tab(
                child: Ripple(
                  onTap: () {
                    return;
                  },
                  child: const Icon(
                    Icons.add_circle,
                    color: AppColors.darkGreen,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class PlanTrip extends StatelessWidget {
  const PlanTrip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      padding: const EdgeInsets.all(16),
      theme: TimelineTheme.of(context).copyWith(
          nodePosition: 0,
          color: AppColors.backgroundDefaultImageColor,
          indicatorTheme: IndicatorThemeData(
              position: 0, color: Theme.of(context).primaryColor, size: 12)),
      builder: TimelineTileBuilder.fromStyle(
        contentsAlign: ContentsAlign.basic,
        connectorStyle: ConnectorStyle.solidLine,
        addSemanticIndexes: true,
        endConnectorStyle: ConnectorStyle.solidLine,
        contentsBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 4.0, bottom: 16.0, right: 0.0),
            child: Row(
              children: [
                Column(children: [
                  Text(
                    '09:00 am',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(height: 1.1),
                  ),
                  Expanded(
                      child: Row(
                    children: [
                      const Icon(Icons.car_crash_outlined),
                      Text('20 min',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  height: 1.1,
                                  color: Theme.of(context).iconTheme.color))
                    ],
                  ))
                ]),
                const HSpacer(8),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.darkGrey.withOpacity(0.2),
                          offset: const Offset(3, 0),
                          blurRadius: 10,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text(
                              'Amet minim mollit non deserunt ullamco est sit aliqua ',
                              maxLines: 2,
                              style: Theme.of(context).textTheme.labelMedium,
                            )),
                            Text(
                              '\$500',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ]),
                      const VSpacer(8),
                      Row(
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
                                    'https://www.studytienganh.vn/upload/2021/05/99552.jpeg',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ))
                        ],
                      )
                    ],
                  ),
                ))
              ],
            )),
        itemCount: 10,
      ),
    );
  }
}
