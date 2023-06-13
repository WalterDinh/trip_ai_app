import 'package:flutter/material.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/ui/screens/profile/widgets/card_statistic.dart';

class StatisticCardModel {
  final String icon;
  final String content;

  StatisticCardModel(this.icon, this.content);
}

class GridCardStatistic extends StatelessWidget with BaseWidgetMixin {
  const GridCardStatistic({super.key, required this.items});

  final List<StatisticCardModel> items;

  @override
  Widget body(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 4,
      crossAxisSpacing: 16,
      mainAxisSpacing: 14,
      shrinkWrap: true,
      children: List.generate(items.length, (index) {
        StatisticCardModel item = items[index];

        return CardStatistic(icon: item.icon, content: item.content);
      }),
    );
  }
}
