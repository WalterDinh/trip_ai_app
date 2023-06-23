import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/routes.dart';
import 'package:my_app/ui/widgets/cache_image.dart';
import 'package:my_app/ui/widgets/dropdown_button_icon.dart';
import 'package:my_app/ui/widgets/spacer.dart';
import 'package:timelines/timelines.dart';

double heightImage = 100;
double widthImage = 80;
List<int> list = [1, 2, 3, 4, 5];

enum ItemPlanOption { change, delete }

List<DropdownItem> listMenu = [
  DropdownItem(
      name: 'Change',
      tag: 'change',
      icon: const Icon(Icons.change_circle_outlined)),
  DropdownItem(name: 'Delete', tag: 'delete', icon: const Icon(Icons.delete))
];

class PlanTrip extends StatelessWidget {
  const PlanTrip({
    super.key,
    this.canEdit,
  });
  final bool? canEdit;
  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      padding: const EdgeInsets.all(16),
      theme: TimelineTheme.of(context).copyWith(
          nodePosition: 0,
          color: AppColors.backgroundDefaultImageColor,
          indicatorTheme: IndicatorThemeData(
              position: 0, color: Theme.of(context).primaryColor, size: 12)),
      builder: TimelineTileBuilder.fromStyle(
        contentsAlign: ContentsAlign.basic,
        connectorStyle: ConnectorStyle.solidLine,
        addSemanticIndexes: true,
        endConnectorStyle: ConnectorStyle.solidLine,
        contentsBuilder: (context, index) => ItemPlan(
          canEdit: canEdit,
          onPressOption: (tag) {
            return;
          },
        ),
        itemCount: 10,
      ),
    );
  }
}

class ItemPlan extends StatelessWidget {
  const ItemPlan({
    super.key,
    this.canEdit,
    required this.onPressOption,
  });
  final bool? canEdit;
  final Function(ItemPlanOption) onPressOption;

  _handleSelectOption(DropdownItem item) {
    switch (item.tag) {
      case 'delete':
        return onPressOption(ItemPlanOption.delete);
      default:
        return onPressOption(ItemPlanOption.change);
    }
  }

  _navigationToDetailPlace() {
    AppNavigator.push(Routes.place_detail);
  }

  @override
  Widget build(BuildContext context) {
    var rng = Random();
    bool a = rng.nextInt(2) == 1;

    return Padding(
        padding: const EdgeInsets.only(left: 4.0, bottom: 16.0, right: 0.0),
        child: Row(
          children: [
            Column(children: [
              Text(
                '09:00 am',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(height: 1.1),
              ),
              Expanded(
                  child: Row(
                children: [
                  const Icon(Icons.car_crash_outlined),
                  Text('20 min',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          height: 1.1,
                          color: Theme.of(context).iconTheme.color))
                ],
              ))
            ]),
            const HSpacer(8),
            Expanded(
                child: Column(children: [
              InkWell(
                onTap: _navigationToDetailPlace,
                child: Container(
                  margin: const EdgeInsets.only(top: 12),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.darkGrey.withOpacity(0.2),
                          offset: const Offset(3, 0),
                          blurRadius: 10,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text(
                              'Amet minim mollit non deserunt ullamco est sit aliqua ',
                              maxLines: 2,
                              style: Theme.of(context).textTheme.labelMedium,
                            )),
                            SizedBox(
                                height: 24.0,
                                width: 24.0,
                                child: PopUpMenuButtonIcon(
                                  listButton: listMenu,
                                  onPress: (value) =>
                                      _handleSelectOption(value),
                                )),
                          ]),
                      const VSpacer(4),
                      a
                          ? _itemImageTextRow(context)
                          : _itemImageTextColumn(context),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: canEdit == true,
                child: _itemAdd(context),
              )
            ]))
          ],
        ));
  }

  Widget _itemImageTextColumn(BuildContext context) {
    return Column(children: [
      Text(
        'Amet minim mollit non deserunt ullamco est sit.',
        style: Theme.of(context).textTheme.labelSmall,
      ),
      const VSpacer(8),
      SizedBox(
          height: 64,
          child: Row(
            children: List.generate(3, (int i) {
              return Container(
                margin: const EdgeInsets.all(2),
                height: 60,
                width: 60,
                child: const ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppValues.radius_6),
                  ),
                  child: CacheImage(
                    fit: BoxFit.fitHeight,
                    path:
                        'https://www.studytienganh.vn/upload/2021/05/99552.jpeg',
                  ),
                ),
              );
            }),
          ))
    ]);
  }

  Widget _itemAdd(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppValues.activeIndicatorSize),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: InkWell(
            onTap: () {
              AppNavigator.push(Routes.search_place);
            },
            child: DottedBorder(
                color: AppColors.grey,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                borderType: BorderType.RRect,
                radius: const Radius.circular(4),
                strokeWidth: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Theme.of(context).primaryColor,
                    ),
                    const Text('Add more activity'),
                  ],
                )),
          )),
        ],
      ),
    );
  }

  Widget _itemImageTextRow(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: heightImage,
          width: widthImage,
          child: const ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(AppValues.radius_12),
            ),
            child: CacheImage(
              fit: BoxFit.cover,
              path: 'https://www.studytienganh.vn/upload/2021/05/99552.jpeg',
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ))
      ],
    );
  }
}
