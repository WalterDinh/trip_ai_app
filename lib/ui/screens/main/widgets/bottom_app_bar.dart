import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/configs/colors.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int index) onTap;
  final List<String> listOfIcons;

  const CustomBottomBar(
      {super.key,
      required this.currentIndex,
      required this.onTap,
      required this.listOfIcons});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconWidth = screenWidth * .064;
    double buttonIconWidth = iconWidth * 2;
    double listPaddingHorizontal = 4;
    double margin = 30;
    double marginHorizontal = 16;
    double containerButton = (screenWidth -
            margin * 2 -
            listPaddingHorizontal * 2 +
            marginHorizontal * 2) /
        5;

    return Container(
      margin: EdgeInsets.only(
          bottom: margin,
          left: marginHorizontal,
          right: marginHorizontal,
          top: 0),
      height: screenWidth * .185,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.elevatedContainerColorOpacity,
            spreadRadius: 3,
            blurRadius: 8,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListView.builder(
        itemCount: listOfIcons.length,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: listPaddingHorizontal),
        itemBuilder: (context, index) {
          bool isSelected = index == currentIndex;
          bool isAddIcon = index == 2;

          return InkWell(
            onTap: () => onTap(index),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: SizedBox(
                width: containerButton,
                child: Center(
                    child: Container(
                  width: buttonIconWidth,
                  alignment: Alignment.center,
                  child: isAddIcon
                      ? SvgPicture.asset(
                          listOfIcons[index],
                          width: buttonIconWidth,
                          height: buttonIconWidth,
                        )
                      : SvgPicture.asset(
                          listOfIcons[index],
                          width: iconWidth,
                          height: iconWidth,
                          color: isSelected
                              ? Theme.of(context).focusColor
                              : Theme.of(context).hintColor,
                        ),
                ))),
          );
        },
      ),
    );
  }
}
