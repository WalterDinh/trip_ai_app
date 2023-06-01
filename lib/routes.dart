import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/fade_page_route.dart';
import 'package:my_app/states/sign_up/sign_up_cubit.dart';
import 'package:my_app/ui/screens/home/home.dart';
import 'package:my_app/ui/screens/intro/intro.dart';
import 'package:my_app/ui/screens/login/login_page.dart';
import 'package:my_app/ui/screens/main/main_app.dart';
import 'package:my_app/ui/screens/signup/sign_up_page.dart';
import 'package:my_app/ui/screens/welcome/welcome_page.dart';
import 'package:my_app/ui/screens/notifications/notifications.dart';

enum Routes { splash, home, welcome, login, sign_up, main }

class _Paths {
  static const String splash = '/';
  static const String home = '/home';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String sign_up = '/sign_up';
  static const String main = '/main';

  static const Map<Routes, String> _pathMap = {
    Routes.splash: _Paths.splash,
    Routes.home: _Paths.home,
    Routes.welcome: _Paths.welcome,
    Routes.login: _Paths.login,
    Routes.sign_up: _Paths.sign_up,
    Routes.main: _Paths.main,
  };

  static String of(Routes route) => _pathMap[route] ?? splash;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.welcome:
        return FadeRoute(page: const WelcomeScreen());
      case _Paths.sign_up:
        return FadeRoute(
            page: BlocProvider(
                create: (_) => SignUpCubit(), child: const SignUpScreen()));
      case _Paths.home:
        return FadeRoute(page: const HomeScreen());
      case _Paths.login:
        return FadeRoute(page: const LoginScreen());
      case _Paths.main:
        return FadeRoute(page: MainAppNavigator());
      default:
        return FadeRoute(page: const IntroScreen());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}
