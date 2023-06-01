import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/ui/widgets/ripple.dart';

class StackAvatarCircle extends StatelessWidget {
  final List<String> listAvatar;
  final int? numberShow;
  final Function onPress;

  const StackAvatarCircle(
      {Key? key,
      required this.listAvatar,
      this.numberShow = 4,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthFactor = 0.6;

    return Ripple(
      onTap: onPress(),
      child: LimitedBox(
        maxHeight: AppValues.circularImageSize_30,
        maxWidth: AppValues.circularImageSize_30 * numberShow!,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:
              listAvatar.length > numberShow! ? numberShow : listAvatar.length,
          reverse: false,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            bool haveMore =
                index == numberShow! - 1 && listAvatar.length > numberShow!;

            return Align(
              widthFactor: widthFactor,
              child: ClipOval(
                child: Container(
                    alignment: Alignment.center,
                    color: AppColors.backgroundDefaultImageColor,
                    height: AppValues.iconDefaultSize,
                    width: AppValues.iconDefaultSize,
                    child: haveMore
                        ? Text(
                            '+${listAvatar.length - numberShow!}',
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          )
                        : Image.network(
                            listAvatar[index],
                          )),
              ),
            );
          },
        ),
      ),
    );
  }
}
