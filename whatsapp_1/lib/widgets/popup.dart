import 'package:flutter/material.dart';

class ProfilePopup extends StatelessWidget {
  final String profilePicUrl;
  final String name;

  const ProfilePopup({super.key, required this.profilePicUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(profilePicUrl),
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.call),
                onPressed: () {
                  Navigator.pop(context);
                  
                },
              ),
              IconButton(
                icon: Icon(Icons.message),
                onPressed: () {
                  Navigator.pop(context);
                 
                },
              ),
              IconButton(
                icon: Icon(Icons.video_call),
                onPressed: () {
                  Navigator.pop(context);
                 
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
