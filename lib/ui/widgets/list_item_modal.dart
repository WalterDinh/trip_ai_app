import 'package:flutter/material.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/ui/widgets/modal.dart';
import 'package:my_app/ui/widgets/ripple.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class ListItemModal<T> extends StatelessWidget with BaseWidgetMixin {
  const ListItemModal({
    super.key,
    this.title,
    required this.listItem,
    this.onSelect,
  });

  final String? title;
  final List<T> listItem;
  final Function(T)? onSelect;

  @override
  Widget body(BuildContext context) {
    return Modal(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          _title(context, title),
          const VSpacer(24),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = listItem[index];

                return Ripple(
                  onTap: () {
                    onSelect?.call(item);
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(item.toString(), textAlign: TextAlign.center),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const VSpacer(4);
              },
              itemCount: listItem.length),
        ]),
      ),
    );
  }

  Widget _title(BuildContext context, String? title) {
    return Visibility(
      visible: title != null,
      child: Text(
        title ?? "",
        style: Theme
            .of(context)
            .textTheme
            .headlineMedium,
      ),
    );
  }
}
