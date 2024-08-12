import "package:flutter/material.dart";
import "package:whatsapp_1/colors.dart";
import "package:whatsapp_1/responsive/responsive_layout.dart";
import "package:whatsapp_1/screens/mobile_screen.dart";
void main(){
  runApp(Myapp());
}




class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatapp',
      theme:ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor ),
          home: ResponsiveLayout(mobileScreenLayout: MobileScreen()),
    );
  }
}