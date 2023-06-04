import 'package:flutter/material.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';

class ItemFriend extends StatelessWidget with BaseWidgetMixin {
  const ItemFriend({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.account_circle),
      ),
      title: Text('Nguyen Gnauq'),
      trailing: Icon(Icons.chevron_right),
    );
  }
}
