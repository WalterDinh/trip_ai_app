import 'package:flutter/material.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/ui/widgets/list_item_modal.dart';

class Level {
  final int id;
  final String label;

  const Level(this.id, this.label);

  @override
  String toString() {
    return label;
  }
}

class LevelModal extends StatelessWidget with BaseWidgetMixin {
  const LevelModal({Key? key, this.onSelect}) : super(key: key);

  final Function(Level)? onSelect;

  @override
  Widget body(BuildContext context) {
    final listItem = [
      const Level(1, "Intern"),
      const Level(2, "Fresher"),
      const Level(3, "Junior"),
      const Level(4, "Middle"),
      const Level(5, "Senior"),
      const Level(6, "Expert"),
    ];

    return ListItemModal<Level>(
      title: "Trình độ",
      listItem: listItem,
      onSelect: onSelect,
    );
  }
}
