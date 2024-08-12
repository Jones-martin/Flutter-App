import 'package:flutter/material.dart';
import 'package:whatsapp_1/colors.dart';
import 'package:whatsapp_1/info.dart';
import 'package:whatsapp_1/screens/mobile_chats.dart';
import 'package:whatsapp_1/widgets/popup.dart';

class ContackList extends StatelessWidget {
  final String searchQuery;

  const ContackList({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    final filteredInfo = info.where((contact) {
      final name = contact['name'].toString().toLowerCase();
      final message = contact['message'].toString().toLowerCase();
      final query = searchQuery.toLowerCase();
      return name.contains(query) || message.contains(query);
    }).toList();

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredInfo.length,
                itemBuilder: (context, index) {
                  final contact = filteredInfo[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MobileChats()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ListTile(
                        title: Text(
                          contact['name'].toString(),
                          style: TextStyle(fontSize: 18),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Text(
                            contact['message'].toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        leading: InkWell(
                          onTap: () => _showProfileOptions(context, contact),
                          child: CircleAvatar(
                            radius: 22,
                            backgroundImage:
                            
                                NetworkImage(contact['profilePic'].toString()),
                          ),
                        ),
                        trailing: Text(
                          contact['time'].toString(),
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          const Divider(
            color: dividerColor,
            indent: 85,
          )
        ],
      ),
    );
  }

  void _showProfileOptions(BuildContext context, Map<String, dynamic> contact) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ProfilePopup(
          profilePicUrl: contact['profilePic'].toString(),
          name: contact['name'].toString(),
        );
      },
    );
  }
}
