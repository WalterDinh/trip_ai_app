import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/core/extensions/extension.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/ui/widgets/cache_image.dart';

class ItemCategory extends StatelessWidget with BaseWidgetMixin {
  final String categoryName;
  final String path;
  final Function() onTab;

  ItemCategory({
    Key? key,
    required this.categoryName,
    required this.path,
    required this.onTab,
  }) : super(key: key);

  @override
  Widget body(BuildContext context) {
    double widthCard = MediaQuery.of(context).size.width * 0.22;
    double heightCard = widthCard;

    return Container(
        width: widthCard,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: widthCard,
              height: heightCard,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(AppValues.radius_12)),
                child: CacheImage(
                  fit: BoxFit.cover,
                  path: path,
                ),
              ).fadeAnimation(0.5),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                categoryName,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.textColorGreyLight),
                softWrap: false,
                overflow: TextOverflow.fade,
                maxLines: 1,
              ),
            ),
          ],
        )).fadeAnimation(0.5);
  }
}
