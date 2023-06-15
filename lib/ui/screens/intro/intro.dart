import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/routes.dart';
import 'package:my_app/ui/widgets/ripple.dart';
import 'package:my_app/ui/widgets/spacer.dart';
import 'package:my_app/utils/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

final List<AssetImage> _pages = [
  AppImages.introduction1,
  AppImages.introduction2,
  AppImages.introduction3
];

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _activePage = 0;
  bool loading = true;
  void checkData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isFirstOpenApp = prefs.getString(firstOpenApp) ?? "";

    if (isFirstOpenApp.isEmpty) {
      await prefs.setString(firstOpenApp, "is not the first open app");
      setState(() {
        loading = false;
      });
    } else {
      AppNavigator.replaceWith(Routes.welcome);
    }
  }

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() async {
      await Future.delayed(const Duration(milliseconds: 400));
      checkData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: loading
            ? const SizedBox()
            : Column(children: [
                _buildPageView(),
                const VSpacer(8),
                pagination(_activePage),
                const VSpacer(24)
              ]));
  }

  List<Widget> itemPaginationSliders(num currentIndex) {
    return _pages.map((item) {
      num index = _pages.indexOf(item);
      bool isSelected = currentIndex == index;
      double currentPaginationWidth = 25.0;

      return Container(
        margin: const EdgeInsets.all(4),
        height: 10,
        width: isSelected ? currentPaginationWidth : 10,
        decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).primaryColor
                : AppColors.darkGrey,
            borderRadius: BorderRadius.circular(5.0)),
      );
    }).toList();
  }

  Widget pagination(int currentIndex) {
    bool isLastItem = currentIndex == (_pages.length - 1);

    return Container(
        margin: const EdgeInsets.only(top: AppValues.extraLargePadding),
        padding:
            const EdgeInsets.symmetric(horizontal: AppValues.extraLargePadding),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: AppValues.iconLargeSize,
              ),
              Row(children: itemPaginationSliders(currentIndex)),
              SizedBox(
                  height: AppValues.iconLargeSize,
                  width: AppValues.iconLargeSize,
                  child: isLastItem
                      ? Ripple(
                          onTap: () {
                            AppNavigator.replaceWith(Routes.welcome);
                          },
                          child: Icon(
                            Icons.arrow_forward,
                            color: Theme.of(context).primaryColor,
                            size: AppValues.iconLargeSize,
                          ),
                        )
                      : null)
            ]));
  }

  Widget _buildPageView() => Expanded(
        child: PageView.builder(
            pageSnapping: true,
            onPageChanged: (int index) {
              setState(() {
                _activePage = index;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft:
                          Radius.circular(AppValues.extraLargeImageRadius),
                      bottomRight:
                          Radius.circular(AppValues.extraLargeImageRadius)),
                  color: AppColors.whiteGrey,
                  boxShadow: [
                    BoxShadow(
                        blurStyle: BlurStyle.inner,
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        blurRadius: 16,
                        offset: Offset(0, -1)),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft:
                          Radius.circular(AppValues.extraLargeImageRadius),
                      bottomRight:
                          Radius.circular(AppValues.extraLargeImageRadius)),
                  child: Image(
                    image: _pages[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
      );
}
