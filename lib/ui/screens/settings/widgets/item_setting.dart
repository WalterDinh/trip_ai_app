import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/ui/widgets/ripple.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class ItemSetting extends StatelessWidget {
  const ItemSetting({
    super.key,
    required this.title,
    required this.onPress,
    this.rightView,
  });

  final String title;
  final Function() onPress;
  final Widget? rightView;
  @override
  Widget build(BuildContext context) {
    return Ripple(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    // color: AppColors.textColorGreyLight,
                    fontWeight: FontWeight.w400),
              ),
            ),
            rightView ??
                const Icon(
                  Icons.arrow_forward_ios,
                  size: AppValues.iconSmallerSize,
                  color: AppColors.black,
                )
          ],
        ),
      ),
    );
  }
}
