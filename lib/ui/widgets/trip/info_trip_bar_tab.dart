import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/ui/widgets/ripple.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class PlanTabBarItem {
  final String label;
  final Widget widget;

  PlanTabBarItem(this.label, this.widget);
}

class InfoTripBarTab extends StatefulWidget {
  const InfoTripBarTab({
    super.key,
    required this.onChangeTab,
    required this.myTabs,
  });
  final List<PlanTabBarItem> myTabs;
  final Function(int key) onChangeTab;
  @override
  State<InfoTripBarTab> createState() => _InfoTripBarTabState();
}

class _InfoTripBarTabState extends State<InfoTripBarTab> {
  int activeIndex = 0;

  void onChangeTab(int key) {
    setState(() {
      activeIndex = key;
    });
    widget.onChangeTab(key);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.1,
            child: Row(
                children: widget.myTabs.asMap().entries.map((e) {
              bool isActive = activeIndex == e.key;

              return Row(
                children: [
                  Ripple(
                    onTap: () => onChangeTab(e.key),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: isActive ? 16 : 0, vertical: 8),
                      decoration: isActive
                          ? BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(6)))
                          : null,
                      child: Text(
                        e.value.label,
                        style: TextStyle(
                            color:
                                isActive ? Colors.white : AppColors.blueGrey),
                      ),
                    ),
                  ),
                  const HSpacer(16)
                ],
              );
            }).toList())));
  }
}
