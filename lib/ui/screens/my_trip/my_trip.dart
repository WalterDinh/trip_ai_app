import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/base/base_widget_screen_mixin.dart';
import 'package:my_app/ui/screens/my_trip/old_trip.dart';
import 'package:my_app/ui/screens/my_trip/upcoming_trip.dart';
import 'package:my_app/ui/widgets/ripple.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class MyTrip {
  static const upcoming_trip = 0;
  static const old_trip = 1;
}

final List<Widget> _pages = [const UpcomingTripScreen(), const OldTripPage()];

class MyTripScreen extends StatefulWidget {
  const MyTripScreen({Key? key}) : super(key: key);

  @override
  State<MyTripScreen> createState() => _MyTripScreenState();
}

class _MyTripScreenState extends State<MyTripScreen> with BaseState {
  int currentPage = 0;

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        _topTabBar(),
        Expanded(
          child: SizedBox(
            height: double.infinity,
            child: IndexedStack(
              index: currentPage,
              children: _pages,
            ),
          ),
        ),
      ],
    );
  }

  Widget _topTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: _tabUpcomingTrip(),
          ),
          const HSpacer(16),
          Expanded(
            child: _tabOldTrip(),
          )
        ],
      ),
    );
  }

  Widget _tabOldTrip() {
    const double tabHeight = 40;

    return Ripple(
        onTap: () {
          setState(() {
            currentPage = MyTrip.old_trip;
          });
        },
        child: Container(
          height: tabHeight,
          decoration: BoxDecoration(
              color: _isUpcomingTab() ? Colors.white : AppColors.darkGreen,
              border: _isUpcomingTab()
                  ? Border.all(color: AppColors.darkGreen)
                  : null,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              'Chuyến đi cũ',
              style: TextStyle(
                  color: _isUpcomingTab() ? AppColors.darkGreen : Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ));
  }

  Widget _tabUpcomingTrip() {
    const double tabHeight = 40;

    return Ripple(
        onTap: () {
          setState(() {
            currentPage = MyTrip.upcoming_trip;
          });
        },
        child: Container(
          height: tabHeight,
          decoration: BoxDecoration(
              color: _isUpcomingTab() ? AppColors.darkGreen : Colors.white,
              border: _isUpcomingTab()
                  ? null
                  : Border.all(color: AppColors.darkGreen),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              'Chuyến đi sắp tới',
              style: TextStyle(
                  color: _isUpcomingTab() ? Colors.white : AppColors.darkGreen,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ));
  }

  bool _isUpcomingTab() => currentPage == MyTrip.upcoming_trip;
}
