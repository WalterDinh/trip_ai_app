import 'package:flutter/material.dart';
import 'package:my_app/ui/screens/friends/sections/list_friend.dart';
import 'package:my_app/ui/widgets/main_app_bar.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      backgroundColor: Colors.white,
      body: const ListFriend(),
    );
  }
}
