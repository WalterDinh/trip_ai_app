import 'package:flutter/material.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/ui/widgets/list_item_modal.dart';

class Gender {
  final int id;
  final String label;

  const Gender(this.id, this.label);

  @override
  String toString() {
    return label;
  }
}

class GenderModal extends StatelessWidget with BaseWidgetMixin {
  const GenderModal({Key? key, this.onSelect}) : super(key: key);

  final Function(Gender)? onSelect;

  @override
  Widget body(BuildContext context) {
    final listItem = [
      const Gender(0, "Nam"),
      const Gender(1, "Nữ"),
    ];

    return ListItemModal<Gender>(
      title: "Giới tính",
      listItem: listItem,
      onSelect: onSelect,
    );
  }
}
