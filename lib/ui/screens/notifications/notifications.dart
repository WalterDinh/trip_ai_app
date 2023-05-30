import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:my_app/ui/widgets/main_app_bar.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemBuilder: (context, index) => _buildNotificationItem(index),
        itemCount: messages.length,
      ),
    );
  }

  Widget _buildNotificationContent(String url) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(25, 0, 0, 0),
                blurRadius: 15,
                offset: Offset(0, 4))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(url),
                radius: 16,
              ),
              const HSpacer(8),
              CircleAvatar(
                backgroundImage: NetworkImage(url),
                radius: 16,
              )
            ],
          ),
          const Text('Recent tweet from Jack Lemmon')
        ],
      ),
    );
  }

  Widget _buildNotificationItem(int index) {
    return SwipeActionCell(
      backgroundColor: Colors.transparent,
      key: ValueKey(index),
      trailingActions: _buildNotificationActions(index),
      child: _buildNotificationContent(messages[index].profileImageUrl),
    );
  }

  List<SwipeAction> _buildNotificationActions(int index) {
    return [
      SwipeAction(
          color: Colors.transparent,
          widthSpace: 98,
          content: _buildActionButton(Colors.red, Icons.delete),
          onTap: (handler) async {
            messages.removeAt(index);
            setState(() {
              messages;
            });
          }),
    ];
  }

  Widget _buildActionButton(color, icon) {
    return Container(
      margin: const EdgeInsets.only(right: 30),
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(35, 0, 0, 0),
              blurRadius: 15,
              offset: Offset(0, 4))
        ],
        color: color,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}

// todo: remove dummy data

class Message {
  final String username;
  final String profileImageUrl;
  final String lastMessage;
  final String readAt;

  Message(this.username, this.profileImageUrl, this.lastMessage, this.readAt);
}

final List<Message> messages = [
  Message(
      'John Snow',
      'https://cdn.pixabay.com/photo/2019/04/19/13/44/john-snow-4139536_960_720.jpg',
      'I don\'t want it',
      '2021-02-12'),
  Message(
      'Ned Stark',
      'https://images.unsplash.com/photo-1640020374654-ec88277ef55e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDZ8RnpvM3p1T0hONnd8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
      'Winter is coming',
      '2021-11-21'),
  Message(
      'Khaleesi',
      'https://cdn.pixabay.com/photo/2019/03/26/08/47/daenerys-targaryen-4082038_960_720.jpg',
      'I am the one true Queen',
      '2021-10-14'),
  Message(
      'Cersie Lannister',
      'https://images.unsplash.com/photo-1601841981137-966f4a2f8084?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8dG93ZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      'Every breath you draw in my presence annoys me.',
      '2021-04-08'),
  Message(
      'Arya Stark',
      'https://images.unsplash.com/photo-1585943766731-05822da58574?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Z2FtZSUyMG9mJTIwdGhyb25lc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      'Fear cuts deeper than swords',
      '2020-10-12'),
  Message(
      'Hodor',
      'https://images.unsplash.com/photo-1550684393-8e0b1468ca57?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZG9vcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      'I held the door',
      '2021-12-27'),
  Message(
      'Sansa',
      'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      'The lone wolf dies but the pack survives',
      '2021-11-09'),
  Message(
      'Night King',
      'https://images.unsplash.com/photo-1444146085469-2a4ef5a7e5fb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8em9tYmllfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      'Keep that dragon glass away',
      '2021-09-29'),
];
