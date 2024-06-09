
import 'package:btl_flutter/chat.dart';
import 'package:btl_flutter/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatTile extends StatelessWidget {
  final String chatId;
  final String lastMessage;
  final DateTime timestamp;
  final Map<String, dynamic> receiverData;

  const ChatTile({
    Key? key,
    required this.chatId,
    required this.lastMessage,
    required this.timestamp,
    required this.receiverData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context, listen: false);
    final String receiverId = receiverData['uid'];

    return lastMessage != ""
        ? ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(receiverData['imageUrl']),
            ),
            title: Text(
              receiverData['name'],
            ),
            subtitle: Text(
              lastMessage,
              maxLines: 2,
            ),
            trailing: Text(
              '${timestamp.hour}:${timestamp.minute}',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            onTap: () async {
              final chatId = await chatProvider.getChatRoom(receiverId) ?? await chatProvider.createChatRoom(receiverId);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(chatId: chatId, receiverId: receiverId),
                ),
              );
            },
          )
        : Container();
  }
}
