import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_app/ui/widgets/main_app_bar.dart';

mixin BaseState<T extends StatefulWidget> on State<T> {
  late AppLocalizations appLocalization;

  @override
  Widget build(BuildContext context) {
    appLocalization = AppLocalizations.of(context)!;

    return GestureDetector(
      child: Stack(
        children: [
          annotatedRegion(context),
        ],
      ),
    );
  }

  Widget annotatedRegion(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor(),
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Material(
        color: Colors.transparent,
        child: pageScaffold(context),
      ),
    );
  }

  Widget pageScaffold(BuildContext context) {
    return Scaffold(
      extendBody: pageExtendBody(),
      backgroundColor: pageBackgroundColor(),
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(),
      body: Stack(children: [
        // circleRadius(),
        Container(child: pageContent(context)),
      ]),
      bottomNavigationBar: bottomNavigationBar(),
      drawer: drawer(),
    );
  }

  Color pageBackgroundColor() {
    return Colors.white;
  }

  bool pageExtendBody() {
    return false;
  }

  Widget? floatingActionButton() {
    return null;
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? drawer() {
    return null;
  }

  Color statusBarColor() {
    return Colors.red;
  }

  Widget? screenName() {
    return null;
  }

  Widget gradientCircle(AlignmentGeometry alignment, double radius) {
    const double blur = 31.5;

    return Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
          center: alignment,
          radius: radius,
          colors: const <Color>[
            Color(0xFF274342),
            Color.fromARGB(0, 146, 147, 98),
          ],
          tileMode: TileMode.decal,
          stops: const <double>[0, 0.6198],
        )),
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: blur, sigmaY: blur, tileMode: TileMode.clamp),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          ),
        ));
  }

  Widget circleRadius() {
    double radius = 0.6;

    return Stack(
      children: [
        gradientCircle(const Alignment(-1, -0.3), radius),
        gradientCircle(const Alignment(-1, 1.1), radius),
        gradientCircle(const Alignment(1.2, 0.5), radius)
      ],
    );
  }

  Widget pageContent(BuildContext context) {
    return body(context);
  }

  PreferredSizeWidget? appBar(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;

    return MainAppBar(
      title: screenName(),
      showIconBack: canPop,
    );
  }

  Widget body(BuildContext context);
}
