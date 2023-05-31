import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/ui/widgets/input/input_box_component.dart';

class SimpleTextFormFieldDatePickerController<T> {
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

  set value(dynamic value) {
    _value = value;
  }

  void _init(Function(VoidCallback fn) setStateX, bool requiredX) {
    setState = setStateX;
    _required = requiredX;
  }
}

class SimpleTextFormFieldDatePicker<T> extends StatefulWidget {
  final String? label;
  final double? marginBottom;
  final bool required;
  final bool editable;
  final Radius? borderRadius;
  final String Function(T)? valueItem;
  final String hintText;

  final SimpleTextFormFieldDatePickerController controller;
  final Color? fillColor;

  const SimpleTextFormFieldDatePicker({
    Key? key,
    this.label,
    this.marginBottom,
    this.editable = true,
    this.fillColor,
    this.borderRadius,
    this.hintText = "Select One",
    required this.controller,
    this.valueItem,
    this.required = false,
  }) : super(key: key);

  @override
  State<SimpleTextFormFieldDatePicker<T>> createState() =>
      _SimpleTextFormFieldDatePickerState<T>();
}

class _SimpleTextFormFieldDatePickerState<T>
    extends State<SimpleTextFormFieldDatePicker<T>> {
  @override
  void initState() {
    widget.controller._init(
      setState,
      widget.required,
    );
    super.initState();
  }

  void _showModalBottomSheet(BuildContext ctx) {
    const double bottomSheetHeight = 270;
    const double dataPickerHeight = 220;

    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0))),
              height: bottomSheetHeight,
              child: Column(
                children: [
                  buttonBottomSheet(),
                  SizedBox(
                      height: dataPickerHeight,
                      child: CupertinoTheme(
                        data: const CupertinoThemeData(
                          brightness: Brightness.light,
                        ),
                        child: CupertinoDatePicker(
                            use24hFormat: true,
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime:
                                widget.controller._value ?? DateTime.now(),
                            onDateTimeChanged: (val) {
                              widget.controller._rootOnChanged(val);
                            }),
                      ))
                ],
              ),
            ));
  }

  Widget buttonBottomSheet() {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(16)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0))),
              )),
          onPressed: () => null,
          child: const Text("Select date", style: TextStyle(fontSize: 15))),
    );
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
            icon: Icons.date_range_outlined,
            onTap: () => _showModalBottomSheet(context)));
  }
}
