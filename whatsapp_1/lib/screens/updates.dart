import 'package:flutter/material.dart';
import 'package:whatsapp_1/colors.dart';
import 'package:whatsapp_1/info.dart';

class Updates extends StatelessWidget {
  const Updates({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Status",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          margin: const EdgeInsets.only(bottom: 16.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: info.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: tabColor,
                    width: 3,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    info[index]['profilePic'].toString(),
                  ),
                ),
              );
            },
          ),
        ),
        
       
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Channels",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        

        Expanded(
          child: ListView.builder(
            itemCount: channels.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    channels[index]['channelIcon'].toString(),
                  ),
                ),
                title: Text(
                  channels[index]['channelName'].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(channels[index]['channelMessage'].toString()),
                trailing: Text(channels[index]['channelTime'].toString()),
              );
            },
          ),
        ),
      ],
    );
  }
}


final List<Map<String, String>> channels = [
  {
    'channelIcon': 'images/space.jpg', 
    'channelName': 'CNBC-TV18',
    'channelMessage': 'Honasa Consumer expects ₹...',
    'channelTime': '2:47 PM'
  },
  {
    'channelIcon': 'images/space.jpg', 
    'channelName': 'MyGov India',
    'channelMessage': 'Prime Minister Narendra Modi today u...',
    'channelTime': '2:36 PM'
  },
  {
    'channelIcon': 'images/space.jpg', 
    'channelName': 'Star Sports India',
    'channelMessage': 'Can India do a comeback ...',
    'channelTime': '2:47 PM'
  },
  {
    'channelIcon': 'images/space.jpg', 
    'channelName': 'Sairam Institutions',
    'channelMessage': 'Photo',
    'channelTime': '2:47 PM'
  },
];
