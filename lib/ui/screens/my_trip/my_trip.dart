import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/ui/screens/my_trip/old_trip.dart';
import 'package:my_app/ui/screens/my_trip/upcoming_trip.dart';
import 'package:my_app/ui/widgets/main_app_bar.dart';
import 'package:my_app/ui/widgets/ripple.dart';
import 'package:my_app/ui/widgets/spacer.dart';

final List<Widget> _pages = [const UpcomingTripScreen(), const OldTripScreen()];

class MyTripScreen extends StatefulWidget {
  const MyTripScreen({Key? key}) : super(key: key);

  @override
  State<MyTripScreen> createState() => _MyTripScreenState();
}

class _MyTripScreenState extends State<MyTripScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      extendBody: true,
      body: Column(
        children: [
          _buildRowAddFriendAndFollow(),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: IndexedStack(
                index: currentPage,
                children: _pages,
              ),
            ),
          ),
          VSpacer(MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  Widget _buildRowAddFriendAndFollow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: _buildButtonAddFriend(),
          ),
          const HSpacer(16),
          Expanded(
            child: _buildButtonFollow(),
          )
        ],
      ),
    );
  }

  Widget _buildButtonFollow() {
    return Ripple(
        onTap: () {
          setState(() {
            currentPage = 1;
          });
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.darkGreen),
              borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: Text(
              'Chuyến đi cũ',
              style: TextStyle(
                  color: AppColors.darkGreen, fontWeight: FontWeight.w400),
            ),
          ),
        ));
  }

  Widget _buildButtonAddFriend() {
    return Ripple(
        onTap: () {
          setState(() {
            currentPage = 0;
          });
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              color: AppColors.darkGreen,
              borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: Text(
              'Chuyến đi sắp tới',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
            ),
          ),
        ));
  }
}
