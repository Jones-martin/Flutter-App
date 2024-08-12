import 'package:flutter/material.dart';
import 'package:whatsapp_1/colors.dart';
import 'package:whatsapp_1/responsive/camera.dart';
import 'package:whatsapp_1/responsive/qr.dart';
import 'package:whatsapp_1/screens/call_page.dart';
import 'package:whatsapp_1/widgets/contack_list.dart';

import 'package:whatsapp_1/screens/updates.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  _MobileScreenState createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  TextEditingController _searchController = TextEditingController();
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          title: Text(
            "WhatsApp",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Qr()));
              },
              icon: Icon(Icons.qr_code_scanner_rounded, color: Colors.grey),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CameraScreen()));
              },
              icon: Icon(Icons.camera_alt_outlined, color: Colors.grey),
            ),
            IconButton(
              onPressed: () {

              },
              icon: Icon(
                Icons.more_vert,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
           
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: appBarColor,
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search or start a new chat',
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ContackList(searchQuery: searchQuery),
                ),
              ],
            ),

            Updates(),
            Center(child: Text('Join Communities to explore more',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),)),
            CallPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.message_sharp,
            color: Colors.black,
          ),
          backgroundColor: tabColor,
        ),
        bottomNavigationBar: Container(
          color: appBarColor,
          child: const TabBar(
            indicatorColor: tabColor,
            indicatorWeight: 4,
            labelColor: tabColor,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(
                icon: Icon(Icons.chat_rounded),
                text: 'Chats',
              ),
              Tab(
                icon: Icon(Icons.crisis_alert_sharp),
                text: 'Updates',
              ),
              Tab(
                icon: Icon(Icons.groups_2),
                text: 'Communities',
              ),
              Tab(
                icon: Icon(Icons.call_outlined),
                text: 'Calls',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
