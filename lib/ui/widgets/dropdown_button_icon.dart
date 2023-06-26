import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';

import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class DropdownItem {
  final String name;
  final String tag;
  final Widget icon;

  DropdownItem({required this.name, required this.tag, required this.icon});
}

class PopUpMenuButtonIcon extends StatelessWidget {
  const PopUpMenuButtonIcon(
      {super.key, required this.listButton, this.icon, required this.onPress});
  final List<DropdownItem> listButton;
  final Widget? icon;
  final Function(DropdownItem) onPress;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<DropdownItem>(
        color: Colors.white,
        splashRadius: AppValues.iconSize_20,
        icon: icon ??
            const Icon(
              Icons.more_vert,
              color: AppColors.black,
            ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        position: PopupMenuPosition.over,
        onSelected: (value) => onPress(value),
        itemBuilder: (BuildContext context) => listButton
            .map(
              (e) => PopupMenuItem<DropdownItem>(
                value: e,
                height: 12,
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    e.icon,
                    const HSpacer(8),
                    Text(
                      e.name,
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
              ),
            )
            .toList());
  }
}
