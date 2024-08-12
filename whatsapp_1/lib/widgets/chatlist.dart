import 'package:flutter/material.dart';
import 'package:whatsapp_1/info.dart';
import 'package:whatsapp_1/widgets/my_messages.dart';
import 'package:whatsapp_1/widgets/sendermessage.dart';

class Chatlist extends StatelessWidget {
  const Chatlist({super.key, required List<Map<String, dynamic>> messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        if (messages[index]['isMe'] == true) {
          return MyMessages(
              message: messages[index]['text'].toString(),
              date: messages[index]['time'].toString());
        }return Sendermessage(
              message: messages[index]['text'].toString(),
              date: messages[index]['time'].toString());
      },
    );
  }
}
