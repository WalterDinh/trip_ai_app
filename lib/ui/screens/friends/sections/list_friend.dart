import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/ui/screens/friends/widgets/item_friend.dart';

class ListFriend extends StatelessWidget {
  const ListFriend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return const ItemFriend();
        },
        separatorBuilder: (context, index) {
          return const Divider(height: 1, color: AppColors.grey500,);
        },
        itemCount: 5);
  }
}
