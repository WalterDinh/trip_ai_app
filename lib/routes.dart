import 'package:flutter/material.dart';
import 'package:my_app/core/fade_page_route.dart';
import 'package:my_app/ui/screens/home/home.dart';
import 'package:my_app/ui/screens/intro/intro.dart';
import 'package:my_app/ui/screens/login/login_page.dart';
import 'package:my_app/ui/screens/welcome/welcome_page.dart';

enum Routes { splash, home, welcome, login }

class _Paths {
  static const String splash = '/';
  static const String home = '/home';
  static const String welcome = '/welcome';
  static const String login = '/login';

  static const Map<Routes, String> _pathMap = {
    Routes.splash: _Paths.splash,
    Routes.home: _Paths.home,
    Routes.welcome: _Paths.welcome,
    Routes.login: _Paths.login,
  };

  static String of(Routes route) => _pathMap[route] ?? splash;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.welcome:
        return FadeRoute(page: const WelcomeScreen());
      case _Paths.home:
        return FadeRoute(page: const HomeScreen());
      case _Paths.login:
        return FadeRoute(page: const LoginScreen());
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
