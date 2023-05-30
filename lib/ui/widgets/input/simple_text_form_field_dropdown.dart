import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/ui/widgets/input/input_box_component.dart';

class SimpleTextFormFieldDropDownController<T> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  late Function(VoidCallback fn) setState;

  T? _value;
  Function(T? value)? onChanged;
  late bool _required = false;

  dynamic get value {
    return _value;
  }

  void _rootOnChanged(e) {
    setState(() {
      _value = e;
      if (onChanged != null) {
        onChanged!(e);
      }
    });
  }

  String? _validator(v) {
    if (_required && v == null) {
      return 'The field is required';
    }

    return null;
  }

  bool get isValid {
    bool? valid = _key.currentState?.validate();
    if (valid == null) {
      return true;
    }

    return valid;
  }

  void _init(Function(VoidCallback fn) setStateX, bool requiredX) {
    setState = setStateX;
    _required = requiredX;
  }
}

class SimpleTextFormFieldDropDown<T> extends StatefulWidget {
  final String? label;
  final double? marginBottom;
  final bool required;
  final bool editable;
  final Radius? borderRadius;
  final List<T> listItem;
  final String Function(T)? valueItem;
  final String hintText;

  final SimpleTextFormFieldDropDownController controller;
  final Color? fillColor;

  const SimpleTextFormFieldDropDown({
    Key? key,
    this.label,
    this.marginBottom,
    this.editable = true,
    this.fillColor,
    this.borderRadius,
    this.hintText = "Select One",
    required this.listItem,
    required this.controller,
    this.valueItem,
    this.required = false,
  }) : super(key: key);

  @override
  State<SimpleTextFormFieldDropDown<T>> createState() =>
      _SimpleTextFormFieldDropDownState<T>();
}

class _SimpleTextFormFieldDropDownState<T>
    extends State<SimpleTextFormFieldDropDown<T>> {
  @override
  void initState() {
    widget.controller._init(
      setState,
      widget.required,
    );
    super.initState();
  }

  void _showModalBottomSheet() {
    showModalBottomSheet<void>(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppValues.borderBottomSheet),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (BuildContext context) {
          return ModalSelectBottomSheet(
            listItem: widget.listItem,
            value: widget.controller._value,
            valueItem: (item) => widget.valueItem!(item as T),
            onSelect: (item) => widget.controller._rootOnChanged(item),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.controller._key,
        child: InputBoxComponent(
            label: widget.label,
            isRequired: widget.required,
            childText: widget.controller._value != null
                ? widget.valueItem!(widget.controller._value)
                : widget.hintText,
            icon: Icons.arrow_drop_down,
            onTap: _showModalBottomSheet));
  }
}

class ModalSelectBottomSheet<T> extends StatelessWidget {
  const ModalSelectBottomSheet({
    Key? key,
    required this.valueItem,
    required this.listItem,
    required this.value,
    required this.onSelect,
  }) : super(key: key);

  final List<T> listItem;

  final String Function(T)? valueItem;
  final void Function(T) onSelect;
  final T value;

  @override
  Widget build(BuildContext context) {
    const double bottomSheetHeight = 240;
    bool haveData = listItem.isNotEmpty;
    const double emptyBottomSheetHeight = bottomSheetHeight - 60.0;
    const double dataScrollBottomSheetHeight = bottomSheetHeight - 28.0;

    return Container(
      color: Colors.white,
      height: bottomSheetHeight,
      child: Column(
        children: [
          Center(child: _buildHandleActionWidget()),
          SizedBox(
            height: dataScrollBottomSheetHeight,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 16),
              child: haveData
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: listItem.map((e) {
                        bool isSelected = value == e;

                        return InkWell(
                          onTap: () {
                            onSelect(e);
                            Navigator.pop(context);
                          },
                          child: _buildItemSelectWidget(isSelected, e, context),
                        );
                      }).toList(),
                    )
                  : _buildListEmptyWidget(emptyBottomSheetHeight),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHandleActionWidget() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(2.0),
        ),
        color: AppColors.itemHandleColor,
      ),
      margin: const EdgeInsets.all(10.0),
      height: 5.0,
      width: AppValues.itemHandleBottomSheet,
    );
  }

  Widget _buildItemSelectWidget(bool isSelected, T item, BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
            left: AppValues.largePadding, right: AppValues.largePadding),
        color:
            isSelected ? AppColors.itemBottomSheetSelected : Colors.transparent,
        height: AppValues.itemBottomSheet,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              valueItem!(item),
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: AppColors.darkGrey),
            ),
          ],
        ));
  }

  Widget _buildListEmptyWidget(double emptyBottomSheetHeight) {
    return SizedBox(
      height: emptyBottomSheetHeight,
      child: const Padding(
        padding: EdgeInsets.only(bottom: 16.0),
        child: Center(child: Text('No Data')),
      ),
    );
  }
}
