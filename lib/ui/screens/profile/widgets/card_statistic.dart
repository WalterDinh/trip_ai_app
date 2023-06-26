import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class StatisticCard extends StatelessWidget with BaseWidgetMixin {
  final String text;
  final String iconName;

  const StatisticCard({
    required this.text,
    required this.iconName,
  });

  @override
  Widget body(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: AppColors.grey500,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          SvgPicture.asset(
            iconName,
            color: AppColors.darkGreen,
            width: AppValues.iconSize_20,
            height: AppValues.iconSize_20,
          ),
          const HSpacer(10),
          Text(
            text,
            style: const TextStyle(
                color: AppColors.grey800, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
