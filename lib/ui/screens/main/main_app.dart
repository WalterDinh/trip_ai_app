import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/routes.dart';
import 'package:my_app/ui/screens/home/home.dart';
import 'package:my_app/ui/screens/notifications/notifications.dart';
import 'package:my_app/ui/screens/profile/profile.dart';

import 'widgets/bottom_app_bar.dart';

final List<Widget> _pages = [
  const HomeScreen(),
  const HomeScreen(),
  const HomeScreen(),
  const NotificationScreen(),
  const ProfileScreen(),
];

List<String> listOfIcons = [
  AppImages.homeIcon,
  AppImages.myTripIcon,
  AppImages.circleAddIcon,
  AppImages.notificationIcon,
  AppImages.profileIcon,
];

class MainAppNavigator extends StatefulWidget {
  @override
  State<MainAppNavigator> createState() => _MainAppNavigatorState();
}

class _MainAppNavigatorState extends State<MainAppNavigator> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: currentPage,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: currentPage,
        listOfIcons: listOfIcons,
        onTap: (index) {
          if (index == 2) {
            AppNavigator.push(Routes.login);
          } else {
            setState(() {
              currentPage = index;
              HapticFeedback.lightImpact();
            });
          }
        },
      ),
    );
  }
}
