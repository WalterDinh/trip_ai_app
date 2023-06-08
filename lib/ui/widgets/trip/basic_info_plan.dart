import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/core/extensions/extension.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/ui/widgets/cache_image.dart';

class BasicInfoPLan extends StatelessWidget with BaseWidgetMixin {
  final String imageUrl;
  final String placeName;
  final double rating;

  final int? totalRating;

  const BasicInfoPLan(
      {super.key,
      required this.imageUrl,
      required this.placeName,
      required this.rating,
      this.totalRating});

  @override
  Widget body(BuildContext context) {
    double widthImage = MediaQuery.of(context).size.width - 64;
    double heightImage = widthImage * 426 / 353;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: SizedBox(
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
}
