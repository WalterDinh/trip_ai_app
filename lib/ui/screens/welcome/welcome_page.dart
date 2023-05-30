import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/configs/theme.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/routes.dart';
import 'package:my_app/ui/widgets/ripple.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool loading = true;

  void handleLoginFacebook() {
    return;
  }

  void handleLoginApple() {
    return;
  }

  void handleLoginGoogle() {
    return;
  }

  void checkData() async {
    return;
  }

  void onLogin() async {
    AppNavigator.push(Routes.login);
  }

  @override
  void initState() {
    super.initState();
    checkData();
  }

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width / 2;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(AppImages.welcome.assetName),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(child: containerButton(buttonWidth)),
        ));
  }

  Widget containerButton(double buttonWidth) {
    return Column(
      children: [
        Expanded(child: Container()),
        Column(
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                width: buttonWidth,
                child: ElevatedButton(
                    onPressed: onLogin, child: const Text('Login'))),
            Container(
                margin: const EdgeInsets.only(bottom: 32.0),
                width: buttonWidth,
                child: ElevatedButton(
                    style:
                        ElevatedButtonThemeApp.lightElevatedButtonTheme.style,
                    onPressed: () {
                      return;
                    },
                    child: const Text('Sign Up'))),
            buttonSocial(buttonWidth)
          ],
        )
      ],
    );
  }

  Widget buttonSocial(double buttonWidth) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32.0),
      width: buttonWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Ripple(
            onTap: handleLoginGoogle,
            child: SvgPicture.asset(
              AppImages.googleIcon,
              width: AppValues.iconLargeSize,
              height: AppValues.iconLargeSize,
            ),
          ),
          Ripple(
            onTap: handleLoginApple,
            child: SvgPicture.asset(
              AppImages.appleIcon,
              width: AppValues.iconLargeSize,
              height: AppValues.iconLargeSize,
            ),
          ),
          Ripple(
            onTap: handleLoginFacebook,
            child: SvgPicture.asset(
              AppImages.facebookIcon,
              width: AppValues.iconLargeSize,
              height: AppValues.iconLargeSize,
            ),
          )
        ],
      ),
    );
  }
}
