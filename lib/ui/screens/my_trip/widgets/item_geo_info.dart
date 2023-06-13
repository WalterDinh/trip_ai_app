import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/configs/theme.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class ItemGeoInfo extends StatelessWidget with BaseWidgetMixin {
  const ItemGeoInfo({super.key, required this.title, required this.content});

  final String title;
  final String content;

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextThemeApp.bodySmallerText
                  .copyWith(color: AppColors.itemHandleColor)),
          const VSpacer(4),
          Text(content,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}
