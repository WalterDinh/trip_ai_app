import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/fade_page_route.dart';
import 'package:my_app/states/personal_info/personal_info_bloc.dart';
import 'package:my_app/states/search/search_bloc.dart';
import 'package:my_app/states/sign_up/sign_up_cubit.dart';
import 'package:my_app/ui/screens/change_password/change_pasword_page.dart';
import 'package:my_app/ui/screens/detail_trip/detail_trip_page.dart';
import 'package:my_app/ui/screens/friends/friends.dart';
import 'package:my_app/ui/screens/create_plan_trip/create_plan_trip_page.dart';
import 'package:my_app/ui/screens/create_trip_form/create_trip_form_page.dart';
import 'package:my_app/ui/screens/home/home.dart';
import 'package:my_app/ui/screens/intro/intro.dart';
import 'package:my_app/ui/screens/login/login_page.dart';
import 'package:my_app/ui/screens/main/main_app.dart';
import 'package:my_app/ui/screens/more_trip/more_trip.dart';
import 'package:my_app/ui/screens/notification_detail/notification_detail.dart';
import 'package:my_app/ui/screens/personal_info/personal_info.dart';
import 'package:my_app/ui/screens/place_detail/place_detail.dart';
import 'package:my_app/ui/screens/search_place/search_place_page.dart';
import 'package:my_app/ui/screens/search_trip/search_trip_page.dart';
import 'package:my_app/ui/screens/settings/setting_page.dart';
import 'package:my_app/ui/screens/signup/sign_up_page.dart';
import 'package:my_app/ui/screens/welcome/welcome_page.dart';

enum Routes {
  splash,
  home,
  welcome,
  login,
  sign_up,
  main,
  notification_detail,
  personal_info,
  friends,
  create_trip_form,
  create_plan_trip,
  detail_trip,
  search_trip,
  more_trip,
  setting,
  place_detail,
  change_password,
  search_place
}

enum DetailTripType { upcoming_trip, past_trip, recommend_trip, create_trip }

class _Paths {
  static const String splash = '/';
  static const String home = '/home';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String sign_up = '/sign_up';
  static const String main = '/main';
  static const String notificationDetail = '/notifications/detail';
  static const String personalInfo = '/profile/personal_info';
  static const String friends = '/profile/friends';
  static const String create_trip_form = '/create_trip_form';
  static const String create_plan_trip = '/create_plan_trip';
  static const String detail_trip = '/detail_trip';
  static const String search_trip = '/search_trip';
  static const String more_trip = '/more_trip';
  static const String setting = '/setting';
  static const String place_detail = '/place_detail';
  static const String change_password = '/change_password';
  static const String search_place = '/search_place';

  static const Map<Routes, String> _pathMap = {
    Routes.splash: _Paths.splash,
    Routes.home: _Paths.home,
    Routes.welcome: _Paths.welcome,
    Routes.login: _Paths.login,
    Routes.sign_up: _Paths.sign_up,
    Routes.main: _Paths.main,
    Routes.notification_detail: _Paths.notificationDetail,
    Routes.personal_info: _Paths.personalInfo,
    Routes.friends: _Paths.friends,
    Routes.create_trip_form: _Paths.create_trip_form,
    Routes.create_plan_trip: _Paths.create_plan_trip,
    Routes.detail_trip: _Paths.detail_trip,
    Routes.search_trip: _Paths.search_trip,
    Routes.more_trip: _Paths.more_trip,
    Routes.setting: _Paths.setting,
    Routes.place_detail: _Paths.place_detail,
    Routes.change_password: _Paths.change_password,
    Routes.search_place: _Paths.search_place
  };

  static String of(Routes route) => _pathMap[route] ?? splash;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.welcome:
        return FadeRoute(page: const WelcomeScreen());
      case _Paths.create_trip_form:
        return FadeRoute(page: const CreateTripFormScreen());
      case _Paths.create_plan_trip:
        return FadeRoute(page: const CreatePlanTripScreen());
      case _Paths.sign_up:
        return FadeRoute(
            page: BlocProvider(
                create: (_) => SignUpCubit(), child: const SignUpScreen()));
      case _Paths.home:
        return FadeRoute(page: const HomeScreen());
      case _Paths.search_trip:
        return FadeRoute(
            page: BlocProvider<SearchBloc>(
                create: (context) => SearchBloc(),
                child: const SearchScreen()));
      case _Paths.login:
        return FadeRoute(page: const LoginScreen());
      case _Paths.main:
        return FadeRoute(page: MainAppNavigator());
      case _Paths.notificationDetail:
        return FadeRoute(page: const NotificationDetailScreen());
      case _Paths.personalInfo:
        return FadeRoute(
          page: BlocProvider<PersonalInfoBloc>(
            create: (context) => PersonalInfoBloc(),
            child: const PersonalInfoScreen(),
          ),
        );
      case _Paths.friends:
        return FadeRoute(page: const FriendsScreen());
      case _Paths.detail_trip:
        final args = settings.arguments as DetailTripType;
        return FadeRoute(page: DetailTripScreen(tripType: args));
      case _Paths.more_trip:
        final args = settings.arguments as int;
        return FadeRoute(page: MoreTripScreen(from: args));
      case _Paths.setting:
        return FadeRoute(page: const SettingScreen());
      case _Paths.place_detail:
        return FadeRoute(page: const PlaceDetailScreen());
      case _Paths.change_password:
        return FadeRoute(page: const ChangePasswordScreen());
      case _Paths.search_place:
        return FadeRoute(page: const SearchPlaceScreen());

      default:
        return FadeRoute(page: const IntroScreen());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static void popToTop() => state?.popUntil((route) => route.isFirst);

  static NavigatorState? get state => navigatorKey.currentState;
}
