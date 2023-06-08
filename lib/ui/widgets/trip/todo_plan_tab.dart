import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/ui/widgets/cache_image.dart';
import 'package:my_app/ui/widgets/spacer.dart';
import 'package:timelines/timelines.dart';

double heightImage = 100;
double widthImage = 80;

class TodoPlanTab extends StatefulWidget {
  const TodoPlanTab({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(3),
        Expanded(
            child: TabBarView(
          controller: planTabController,
          children: const <Widget>[PlanTrip(), PlanTrip(), PlanTrip()],
        ))
      ],
    );
  }

  PreferredSizeWidget _buildTabBar(int totalDay) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(children: <Widget>[
            Expanded(
                child: TabBar(
                    isScrollable: totalDay > 4,
                    indicatorColor: Theme.of(context).primaryColor,
                    controller: planTabController,
                    labelColor: AppColors.darkGreen,
                    unselectedLabelColor: AppColors.grey,
                    splashBorderRadius:
                        const BorderRadius.all(Radius.circular(14)),
                    tabs: List<Widget>.generate(
                        totalDay, (index) => Tab(text: 'Day ${index + 1}')))),
            IconButton(
                onPressed: () {
                  return;
                },
                splashRadius: AppValues.iconSize_28,
                icon: const Icon(
                  Icons.add_circle,
                  color: AppColors.darkGreen,
                  size: AppValues.iconSize_28,
                ))
          ])),
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
