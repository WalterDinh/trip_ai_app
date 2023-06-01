import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/core/extensions/extension.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/ui/widgets/ripple.dart';

class ItemTab extends StatelessWidget with BaseWidgetMixin {
  final String tabName;
  final bool selected;
  final Function() onTab;

  ItemTab({
    Key? key,
    required this.tabName,
    required this.selected,
    required this.onTab,
  }) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return Ripple(
        onTap: () {
          return;
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: selected
                  ? Theme.of(context).primaryColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(AppValues.extraLargeRadius)),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 4),
            child: Text(
              tabName,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: selected ? AppColors.whiteGrey : AppColors.grey,
                  height: 0.9),
            ),
          ),
        )).fadeAnimation(0.4);
  }
}
