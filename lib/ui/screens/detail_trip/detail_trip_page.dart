import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_app/configs/theme.dart';
import 'package:my_app/core/base/base_widget_screen_mixin.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/routes.dart';
import 'package:my_app/ui/widgets/spacer.dart';
import 'package:my_app/ui/widgets/trip/basic_info_plan.dart';
import 'package:my_app/ui/widgets/trip/info_trip_bar_tab.dart';
import 'package:my_app/ui/widgets/trip/overview_tab.dart';
import 'package:my_app/ui/widgets/trip/review_tab.dart';
import 'package:my_app/ui/widgets/trip/todo_plan_tab.dart';

final List<PlanTabBarItem> myTabs = [
  PlanTabBarItem(
      'OverViews',
      const OverViewTab(
        budget: '700',
        content:
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
        totalCity: 4,
        totalDays: 3,
        listPhoto: [],
      )),
  PlanTabBarItem('TodoPlan', const TodoPlanTab()),
  PlanTabBarItem('Reviews', const ReviewTab()),
];

class DetailTripScreen extends StatefulWidget {
  const DetailTripScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DetailTripScreenState();
}

class _DetailTripScreenState extends State<DetailTripScreen>
    with TickerProviderStateMixin, BaseState {
  late AppLocalizations appLocalization;
  late TabController tabController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void onCreate() {
    AppNavigator.push(Routes.create_plan_trip);
  }

  @override
  bool pageExtendBody() {
    return true;
  }

  @override
  Widget bottomNavigationBar() {
    return _rowButton();
  }

  @override
  Widget screenName() {
    return const Text("Plan");
  }

  @override
  Widget body(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      animationDuration: const Duration(milliseconds: 400),
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  const BasicInfoPLan(
                      imageUrl:
                          'https://www.studytienganh.vn/upload/2021/05/99552.jpeg',
                      placeName: 'Tokyo',
                      rating: 4.3,
                      totalRating: 300),
                  const VSpacer(8),
                  InfoTripBarTab(
                    myTabs: myTabs,
                    onChangeTab: (key) => tabController.animateTo(key),
                  ),
                  const VSpacer(16)
                ],
              ),
            ))
          ];
        },
        body: TabBarView(
            controller: tabController,
            children: myTabs.map((e) => e.widget).toList()),
      ),
    );
  }

  Widget _rowButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppValues.largePadding),
      child: Row(
        children: [
          // Expanded(
          //     child: Container(
          //         margin: const EdgeInsets.only(bottom: 32.0),
          //         child: ElevatedButton(
          //             style:
          //                 ElevatedButtonThemeApp.lightElevatedButtonTheme.style,
          //             onPressed: () {
          //               return;
          //             },
          //             child: const Text('Reroll Trip')))),
          // const SizedBox(
          //   width: AppValues.extraLargePadding,
          // ),
          Expanded(
              child: Container(
                  margin: const EdgeInsets.only(bottom: 32.0),
                  child: ElevatedButton(
                      onPressed: () {
                        return;
                      },
                      child: const Text('Create trip')))),
        ],
      ),
    );
  }
}
