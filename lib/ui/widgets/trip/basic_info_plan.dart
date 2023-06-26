import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/core/extensions/extension.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/routes.dart';
import 'package:my_app/ui/widgets/cache_image.dart';
import 'package:my_app/ui/widgets/frosted_icon_button.dart';
import 'package:my_app/ui/widgets/spacer.dart';
import 'package:my_app/ui/widgets/trip/place_info_view.dart';

class BasicInfoPLan extends StatelessWidget with BaseWidgetMixin {
  final String imageUrl;
  final String placeName;
  final double rating;
  final DetailTripType type;
  final int? totalRating;

  const BasicInfoPLan(
      {super.key,
      required this.imageUrl,
      required this.placeName,
      required this.rating,
      this.totalRating,
      required this.type});

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Stack(
            children: [
              _itemImage(context),
              _buttonActions(type == DetailTripType.upcoming_trip),
              Positioned(
                bottom: 16,
                right: 20,
                left: 20,
                child: PlaceInfoView(),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                placeName,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              itemRating()
            ],
          ),
        ),
      ],
    );
  }

  Widget _itemImage(BuildContext context) {
    double widthImage = MediaQuery.of(context).size.width - 64;
    double heightImage = widthImage * 426 / 353;

    return SizedBox(
      height: heightImage,
      width: widthImage,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppValues.largeRadius),
        ),
        child: CacheImage(
          fit: BoxFit.cover,
          path: imageUrl,
        ),
      ).fadeAnimation(0.5),
    );
  }

  Widget itemRating() {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: AppColors.yellow,
          size: AppValues.iconLargeSize,
        ),
        Column(
          children: [
            Text('$rating/5'),
            Visibility(
              visible: totalRating != null,
              child: Text('($totalRating)'),
            ),
          ],
        )
      ],
    );
  }

  Widget _buttonActions(bool isShowButtonAddFriend) {
    double margin = 20;

    return Positioned(
      top: margin,
      right: margin,
      child: Column(
        children: [
          const FrostedIconButton(icon: AppImages.heartIcon),
          const VSpacer(12),
          const FrostedIconButton(icon: AppImages.shareIcon),
          const VSpacer(12),
          Visibility(
              visible: isShowButtonAddFriend,
              child: const FrostedIconButton(icon: AppImages.addUserIcon)),
        ],
      ),
    );
  }
}
