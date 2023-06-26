import 'package:flutter/material.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/ui/widgets/list_item_modal.dart';

class Physical {
  final int id;
  final String label;

  const Physical(this.id, this.label);

  @override
  String toString() {
    return label;
  }
}

class PhysicalModal extends StatelessWidget with BaseWidgetMixin {
  const PhysicalModal({Key? key, this.onSelect}) : super(key: key);

  final Function(Physical)? onSelect;

  @override
  Widget body(BuildContext context) {
    final listItem = [
      const Physical(1, "Yếu"),
      const Physical(2, "Trung Bình"),
      const Physical(3, "Khá"),
      const Physical(4, "Tốt"),
      const Physical(5, "Rất Tốt"),
    ];

    return ListItemModal<Physical>(
      title: "Thể lực",
      listItem: listItem,
      onSelect: onSelect,
    );
  }
}
