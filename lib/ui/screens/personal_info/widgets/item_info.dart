import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/ui/widgets/ripple.dart';

class ItemInfo extends StatelessWidget with BaseWidgetMixin {
  const ItemInfo(
      {Key? key, required this.label, required this.content, this.onTap})
      : super(key: key);

  final String label;
  final String content;
  final Function()? onTap;

  @override
  Widget body(BuildContext context) {
    return Ripple(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: AppValues.height_44,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.grey800),
            ),
            Text(
              content,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.grey800),
            ),
          ],
        ),
      ),
    );
  }
}
