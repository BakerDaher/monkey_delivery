import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text("Home Screen "),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //
      //   items: [
      //     BottomNavigationBarItem(
      //         icon:  Icon(Icons.camera),
      //         label: "camera"
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.chat) ,
      //         label: "chat"
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home) ,
      //       label: "home"
      //     ),
      //     BottomNavigationBarItem(
      //       icon:  Icon(Icons.camera),
      //       label: "camera"
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.chat) ,
      //       label: "chat"
      //     ),
      //   ],
      // ),
    );
  }
}
