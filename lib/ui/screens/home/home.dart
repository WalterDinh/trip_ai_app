import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/core/base/base_widget_screen_mixin.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/routes.dart';
import 'package:my_app/states/sign_up/sign_up_cubit.dart';
import 'package:my_app/ui/widgets/ripple.dart';
import 'package:my_app/ui/widgets/spacer.dart';
import 'widgets/item_category.dart';
import 'widgets/item_recommend.dart';
import 'widgets/item_tab.dart';

part 'sections/list_recommend.dart';
part 'sections/list_category.dart';

List<String> dataTab = ['All', 'Popular', 'Rating', 'Most Searched'];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with BaseState {
  bool showTitle = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  void onNavigateToDetail(int id) {
    AppNavigator.push(Routes.detail_trip, DetailTripType.recommend_trip);
  }

  void onNavigateToSearch() {
    AppNavigator.push(Routes.search_trip);
  }

  void onNavigateToSetting() {
    AppNavigator.push(Routes.setting);
  }

  @override
  Widget body(BuildContext context) {
    double aspectRatio = 310 / 210;

    double heightCard =
        (MediaQuery.of(context).size.width * 0.55 * aspectRatio) +
            AppValues.extraSmallPadding;
    double heightCategory = MediaQuery.of(context).size.width * 0.22 + 70;

    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          VSpacer(MediaQuery.of(context).padding.top),
          const VSpacer(AppValues.largeMargin),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppValues.extraLargePadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Hello Sina",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColors.black)),
                    Text("Where do you want to go?",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColors.black)),
                  ],
                ),
                Ripple(
                    onTap: onNavigateToSetting,
                    child: SvgPicture.asset(AppImages.settingIcon))
              ],
            ),
          ),
          _searchBar(),
          tabBar(),
          ListRecommend(heightCard, (id) => onNavigateToDetail(id)),
          const SizedBox(
            height: AppValues.largePadding,
          ),
          ListCategory(heightCategory: heightCategory),
          VSpacer(MediaQuery.of(context).padding.bottom),
        ]),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(AppValues.extraLargePadding),
      child: TextField(
        onTap: onNavigateToSearch,
        decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.textHintColorGrey),
            prefixIcon:
                Icon(Icons.search, color: Theme.of(context).primaryColor),
            contentPadding: const EdgeInsets.all(14),
            fillColor: AppColors.backgroundTextFieldOpacity,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(color: Colors.transparent, width: 0.0),
            ),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
            )),
      ),
    );
  }

  Widget tabBar() {
    double heightTabBar = 30;

    return SizedBox(
      height: heightTabBar,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(parent: PageScrollPhysics()),
        primary: false,
        shrinkWrap: true,
        itemCount: dataTab.length,
        itemBuilder: (_, index) {
          return ItemTab(
            selected: index == 0,
            onTab: () {
              return;
            },
            tabName: dataTab[index],
          );
        },
        padding:
            const EdgeInsets.symmetric(horizontal: AppValues.extraLargePadding),
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.only(left: 24),
          );
        },
      ),
    );
  }
}
