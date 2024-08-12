import 'package:flutter/material.dart';
import 'package:whatsapp_1/colors.dart'; 
import 'package:whatsapp_1/info.dart';

class CallPage extends StatelessWidget {
  const CallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          "Calls",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: info.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                info[index]['profilePic'].toString(),
              ),
            ),
            title: Text(
              info[index]['name'].toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            subtitle: Row(
              children: [
                Icon(
                  Icons.call_received,
                  color: index.isEven ? Colors.green : Colors.red,
                  size: 16,
                ),
                SizedBox(width: 4),
                Text(
                  info[index]['time'].toString(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              icon: Icon(
                index.isEven ? Icons.call : Icons.videocam,
                color: Colors.green,
                size: 24,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CallScreen(
                      name: info[index]['name'].toString(),
                      profilePic: info[index]['profilePic'].toString(),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class CallScreen extends StatelessWidget {
  final String name;
  final String profilePic;

  const CallScreen({super.key, required this.name, required this.profilePic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "End-to-end encrypted",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(profilePic),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.volume_up,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.videocam,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.bluetooth,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.mic_off,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.call_end,
                    color: Colors.red,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
