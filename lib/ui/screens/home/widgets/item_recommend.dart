import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/core/extensions/extension.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/ui/widgets/cache_image.dart';
import 'package:my_app/ui/widgets/elevated_container.dart';
import 'package:my_app/ui/widgets/stack_avatar_circle.dart';

class ItemRecommend extends StatelessWidget with BaseWidgetMixin {
  final String placeName;
  final String locationName;
  final List<String> listAvatar;
  final String path;
  final Function() onTab;

  ItemRecommend({
    Key? key,
    required this.placeName,
    required this.locationName,
    required this.listAvatar,
    required this.path,
    required this.onTab,
  }) : super(key: key);

  @override
  Widget body(BuildContext context) {
    double aspectRatio = 310 / 210;
    double widthCard = MediaQuery.of(context).size.width * 0.56;

    double heightCard = widthCard * aspectRatio + 32;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      height: heightCard,
      width: widthCard,
      child: ElevatedContainer(
        bgColor: AppColors.grey500,
        borderRadius: AppValues.radius_10,
        child: GestureDetector(
          onTap: onTab,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: SizedBox(
                width: widthCard,
                height: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppValues.radius_10),
                      topRight: Radius.circular(AppValues.radius_10)),
                  child: CacheImage(fit: BoxFit.cover, path: path),
                ).fadeAnimation(0.5),
              )),
              _infoView(context,
                  locationName: locationName, placeName: placeName)
            ],
          ),
        ),
      ),
    ).fadeAnimation(0.5);
  }

  Widget _infoView(
    BuildContext context, {
    required String placeName,
    required String locationName,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topInfoView(placeName, context).fadeAnimation(0.6),
          const SizedBox(height: AppValues.margin_4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                color: Theme.of(context).primaryColor,
                size: AppValues.iconSize_14,
              ),
              const SizedBox(width: AppValues.margin_4),
              Expanded(
                child: Text(
                  locationName,
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
          ).fadeAnimation(0.7),
        ],
      ),
    );
  }

  Widget topInfoView(String placeName, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
          placeName,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).primaryColor),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        )),
        IgnorePointer(
            child: StackAvatarCircle(
          listAvatar: listAvatar,
          onPress: () {
            return;
          },
        ))
      ],
    );
  }
}
