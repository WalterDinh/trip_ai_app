import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const double _splashIconSize = 50;

  @override
  void initState() {
    scheduleMicrotask(() async {
      await Future.delayed(const Duration(milliseconds: 400));
      await AppNavigator.replaceWith(Routes.welcome);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image(
            //   image: AppImages.pikloader,
            //   width: _splashIconSize,
            //   height: _splashIconSize,
            //   fit: BoxFit.contain,
            // ),
            const Text(
              'Pokedex',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
