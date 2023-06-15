import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/ui/widgets/elevated_container.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class ItemMoreTrip extends StatelessWidget with BaseWidgetMixin {
  const ItemMoreTrip({Key? key, required this.image}) : super(key: key);

  final AssetImage image;

  @override
  Widget body(BuildContext context) {
    double itemHeight = 130;

    return ElevatedContainer(
      bgColor: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppValues.smallRadius),
        child: Row(
          children: [
            Image(
                height: itemHeight,
                width: itemHeight * 3 / 4,
                fit: BoxFit.cover,
                image: image),
            const HSpacer(8),
            _tripInfo(context),
            const HSpacer(12),
          ],
        ),
      ),
    );
  }

  Expanded _tripInfo(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Column(
            children: [
              _titleTripInfo(context),
              const VSpacer(4),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                "when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                maxLines: 3,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.grey800),
              ),
            ],
          ),
          Column(
            children: [
              const VSpacer(4),
              Row(
                children: const [
                  Icon(Icons.schedule_outlined),
                  HSpacer(8),
                  Text('18 July-19 July')
                ],
              ),
              const VSpacer(4),
              Row(
                children: const [
                  Icon(Icons.people_alt_outlined),
                  HSpacer(8),
                  Text('2 people')
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Row _titleTripInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              'Landmark81',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.darkGreen, height: 1),
            ),
            const Text('#ChuaHoanThanh',
                style: TextStyle(
                    color: AppColors.grey800,
                    fontSize: 12,
                    height: 1,
                    fontWeight: FontWeight.w500)),
          ],
        ),
        Row(
          children: const [
            Icon(Icons.star, color: AppColors.yellow),
            HSpacer(4),
            Text('4.9/5',
                style: TextStyle(
                    color: AppColors.grey800,
                    fontSize: 14,
                    fontWeight: FontWeight.w400))
          ],
        )
      ],
    );
  }
}
