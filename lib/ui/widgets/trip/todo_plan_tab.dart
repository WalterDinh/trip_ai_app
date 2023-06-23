import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/base/base_widget_screen_mixin.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/ui/widgets/trip/plan_trip.dart';

class TodoPlanTab extends StatefulWidget {
  const TodoPlanTab({Key? key, required this.canEdit}) : super(key: key);
  final bool canEdit;
  @override
  State<TodoPlanTab> createState() => _TodoPlanTabState();
}

class _TodoPlanTabState extends State<TodoPlanTab>
    with SingleTickerProviderStateMixin, BaseState {
  late TabController planTabController;

  @override
  void initState() {
    super.initState();
    planTabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(3),
        Expanded(
            child: TabBarView(
          controller: planTabController,
          children: <Widget>[
            PlanTrip(canEdit: widget.canEdit),
            PlanTrip(
              canEdit: widget.canEdit,
            ),
            PlanTrip(
              canEdit: widget.canEdit,
            )
          ],
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
            Visibility(
                visible: widget.canEdit,
                child: IconButton(
                    onPressed: () {
                      return;
                    },
                    splashRadius: AppValues.iconSize_28,
                    icon: const Icon(
                      Icons.add_circle,
                      color: AppColors.darkGreen,
                      size: AppValues.iconSize_28,
                    )))
          ])),
    );
  }
}
