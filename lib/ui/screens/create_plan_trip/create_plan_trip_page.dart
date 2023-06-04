import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_app/configs/theme.dart';
import 'package:my_app/core/extensions/extension.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/routes.dart';
import 'package:my_app/ui/screens/create_plan_trip/sections/review_tab.dart';
import 'package:my_app/ui/widgets/cache_image.dart';

import 'sections/overview_tab.dart';
import 'sections/todo_plan_tab.dart';

final List<String> myTabs = ['OverView', 'ToDO Plan'];

class CreatePlanTripScreen extends StatefulWidget {
  const CreatePlanTripScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CreatePlanTripScreenState();
}

class _CreatePlanTripScreenState extends State<CreatePlanTripScreen>
    with TickerProviderStateMixin {
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
  Widget build(BuildContext context) {
    double widthImage = MediaQuery.of(context).size.width - 64;
    double heightImage = widthImage * 426 / 353;
    double paddingBottom = MediaQuery.of(context).padding.bottom + 64;

    return Scaffold(
      backgroundColor: AppColors.whiteGrey,
      bottomNavigationBar: _rowButton(),
      extendBody: true,
      body: DefaultTabController(
        initialIndex: 1,
        animationDuration: const Duration(milliseconds: 400),
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              const SliverAppBar(
                title: Text('Plan'),
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(color: AppColors.black),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32.0),
                      child: SizedBox(
                        height: heightImage,
                        width: widthImage,
                        child: const ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppValues.largeRadius),
                          ),
                          child: CacheImage(
                            fit: BoxFit.cover,
                            path:
                                'https://www.studytienganh.vn/upload/2021/05/99552.jpeg',
                          ),
                        ).fadeAnimation(0.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Floyd Miles',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          itemRating()
                        ],
                      ),
                    ),
                    _appBarTab(),
                  ],
                ),
              ))
            ];
          },
          body: TabBarView(
            controller: tabController,
            children: <Widget>[
              OverViewTab(paddingBottom: paddingBottom),
              TodoPlanTab(paddingBottom: paddingBottom),
              ReviewViewsTab(paddingBottom: paddingBottom),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemRating() {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: AppColors.yellow,
          size: AppValues.iconLargeSize,
        ),
        Column(
          children: const [
            Text('4.9/5'),
            Text('(17,500)'),
          ],
        )
      ],
    );
  }

  Widget _rowButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppValues.largePadding),
      child: Row(
        children: [
          Expanded(
              child: Container(
                  margin: const EdgeInsets.only(bottom: 32.0),
                  child: ElevatedButton(
                      onPressed: () {
                        return;
                      },
                      child: const Text('Reroll')))),
          const SizedBox(
            width: AppValues.extraLargePadding,
          ),
          Expanded(
              child: Container(
                  margin: const EdgeInsets.only(bottom: 32.0),
                  child: ElevatedButton(
                      style:
                          ElevatedButtonThemeApp.lightElevatedButtonTheme.style,
                      onPressed: () {
                        return;
                      },
                      child: const Text('Continue')))),
        ],
      ),
    );
  }

  Widget _appBarTab() {
    return PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: TabBar(
                  controller: tabController,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: const EdgeInsets.all(2),
                  indicatorColor: Colors.transparent,
                  labelColor: AppColors.darkGreen,
                  unselectedLabelColor: AppColors.grey,
                  tabs: const [
                    Tab(text: 'OverView'),
                    Tab(text: 'Todo Plan'),
                    Tab(text: 'Reviews'),
                  ],
                ))));
  }
}
