import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class CardStatistic extends StatelessWidget with BaseWidgetMixin {
  final String icon;
  final String content;

  const CardStatistic({
    required this.icon,
    required this.content,
  });

  @override
  Widget body(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: AppColors.grey500, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            color: AppColors.darkGreen,
            width: AppValues.iconSize_20,
            height: AppValues.iconSize_20,
          ),
          const HSpacer(10),
          Text(
            content,
            style: const TextStyle(
                color: AppColors.grey800, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
