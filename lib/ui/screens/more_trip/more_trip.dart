import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/core/base/base_widget_screen_mixin.dart';
import 'package:my_app/ui/screens/more_trip/widgets/item_more_trip.dart';
import 'package:my_app/ui/screens/my_trip/my_trip.dart';
import 'package:my_app/ui/widgets/spacer.dart';

part 'old_trip.dart';
part 'upcoming_trip.dart';

class MoreTripScreen extends StatefulWidget {
  const MoreTripScreen({Key? key, this.from = MyTrip.upcoming_trip})
      : super(key: key);

  final int from;

  @override
  State<MoreTripScreen> createState() => _MoreTripScreenState();
}

class _MoreTripScreenState extends State<MoreTripScreen>
    with BaseState, SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: 2, initialIndex: widget.from);
  }

  @override
  Widget body(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: const [
        UpcomingTripPage(),
        OldTripPage(),
      ],
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      bottom: TabBar(
        controller: _tabController,
        tabs: const [
          Tab(text: 'Chuyến đi sắp tới'),
          Tab(text: 'Chuyến đi cũ'),
        ],
        labelColor: AppColors.darkGreen,
        unselectedLabelColor: AppColors.grey800,
        indicatorColor: AppColors.darkGreen,
      ),
    );
  }
}
