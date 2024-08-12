import 'package:flutter/material.dart';
import 'package:whatsapp_1/colors.dart';
import 'package:whatsapp_1/info.dart';
import 'package:whatsapp_1/widgets/chatlist.dart';

class MobileChats extends StatefulWidget {
  const MobileChats({super.key});

  @override
  _MobileChatsState createState() => _MobileChatsState();
}

class _MobileChatsState extends State<MobileChats> {
  final List<Map<String, dynamic>> _messages = List.from(messages); // Initialize with existing messages
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    final String messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      setState(() {
        _messages.add({
          'isMe': true, 
          'text': messageText,
          'time': TimeOfDay.now().format(context), 
        });
        _messageController.clear(); 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        centerTitle: false,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          
          ],
        ),
        title: Flexible(
          child: Text(
            info[0]['name'].toString(),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.video_call_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Chatlist(messages: _messages), 
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: appBarColor,
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
                          onPressed: () {
                         
                          },
                        ),
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            decoration: InputDecoration(
                              hintText: 'Message',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.attach_file, color: Colors.grey),
                          onPressed: () {
                            
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.camera_alt_outlined, color: Colors.grey),
                          onPressed: () {
                            
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 50, 
                    height: 50, 
                    child: FloatingActionButton(
                      onPressed: _sendMessage,
                      child: Icon(Icons.mic),
                      backgroundColor: tabColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
