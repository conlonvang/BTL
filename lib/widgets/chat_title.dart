// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String chatId;
  final String lastMessage;
  final DateTime timestamp;
  final Map<String, dynamic> receverData;
  const ChatTile({
    Key? key,
    required this.chatId,
    required this.lastMessage,
    required this.timestamp,
    required this.receverData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return lastMessage != ""
        ? ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(receverData['imageUrl']),
            ),
            title: Text(
              receverData['name'],
            ),
            subtitle: Text(
              lastMessage,
              maxLines: 2,
            ),
            trailing: Text(
              '${timestamp.hour}:${timestamp.minute}',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            onTap: () {
         //     Navigator.push(context ,MaterialPageRoute(builder: (context) => ,))
            },
          )
        : Container();
  }
}
