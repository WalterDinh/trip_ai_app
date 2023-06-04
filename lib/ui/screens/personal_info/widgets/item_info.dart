import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';

class ItemInfo extends StatelessWidget with BaseWidgetMixin {
  const ItemInfo({Key? key, required this.label, required this.content})
      : super(key: key);

  final String label;
  final String content;

  @override
  Widget body(BuildContext context) {
    return SizedBox(
      height: 44,
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
    );
  }
}
