import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/values/app_values.dart';

class InputBoxComponent extends StatelessWidget {
  final String? label;
  final EdgeInsets edgeInsets;
  final String? childText;
  final Widget? children;
  final Widget? childrenSizeBox;
  final GestureTapCallback? onTap;
  final bool allowClear;
  final String? errorMessage;
  final IconData? icon;
  final bool isRequired;
  final bool? editable;
  final Function()? clearOnTab;
  final double heightOfSizeBox;

  const InputBoxComponent({
    Key? key,
    this.label,
    this.edgeInsets = const EdgeInsets.all(0),
    this.childText,
    this.onTap,
    this.children,
    this.childrenSizeBox,
    this.heightOfSizeBox = AppValues.inputHeight,
    this.allowClear = false,
    this.clearOnTab,
    this.errorMessage,
    this.isRequired = false,
    this.icon,
    this.editable,
  }) : super(key: key);
  static const double borderWidth8 = .8;
  static const double borderWidth1 = .1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: label != null,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: (isRequired)
                    ? Row(
                        children: [
                          Text(
                            label ?? '-',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: AppColors.grey800),
                          ),
                          const Text(
                            "*",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      )
                    : Text(
                        label ?? '-',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: AppColors.grey800),
                      ),
              ),
              const Padding(padding: EdgeInsets.all(2)),
            ],
          ),
        ),
        Visibility(
          visible: children == null,
          child: Column(
            children: [
              Container(
                height: heightOfSizeBox,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: errorMessage != null
                      ? Border.all(
                          color: Colors.red.shade700, width: borderWidth8)
                      : Border.all(color: AppColors.grey, width: borderWidth8),
                ),
                padding: childrenSizeBox != null
                    ? null
                    : const EdgeInsets.only(left: 10, right: 10),
                child: childrenSizeBox ??
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: onTap,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                childText ?? '',
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: allowClear,
                          child: SizedBox(
                            width: AppValues.margin_20,
                            height: AppValues.margin_30,
                            child: InkWell(
                              onTap: clearOnTab,
                              child: const Icon(
                                Icons.clear,
                                size: AppValues.iconSize_14,
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: !allowClear && icon != null,
                          child: SizedBox(
                            width: AppValues.margin_20,
                            height: AppValues.margin_30,
                            child: InkWell(
                              onTap: onTap,
                              child: Icon(
                                icon,
                                size: AppValues.iconSize_14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              ),
              Visibility(
                visible: errorMessage != null,
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 8,
                    left: 12,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      errorMessage ?? "",
                      style: TextStyle(color: Colors.red.shade700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: children != null,
          child: Column(
            children: [
              children ?? Container(),
              Visibility(
                visible: errorMessage != null,
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 8,
                    left: 12,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      errorMessage ?? "",
                      style: TextStyle(color: Colors.red.shade700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(padding: edgeInsets),
      ],
    );
  }
}
