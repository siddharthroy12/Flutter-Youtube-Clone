import 'package:flutter/material.dart';
import './header.dart';
import './sidebar.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  bool expandSidebar = true;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void toggleSidebar() {
    setState(() {
      if (MediaQuery.of(context).size.width < 1300) {
        _scaffoldKey.currentState!.openDrawer();
      } else {
        expandSidebar = !expandSidebar;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: Header(onMenuTap: toggleSidebar),
      drawer: SideBar(showBanner: true, scaffoldKey: _scaffoldKey),
      body: Row(
        children: [
          SideBar(
            showMini: MediaQuery.of(context).size.width < 1300 ? true : !expandSidebar,
            scaffoldKey: _scaffoldKey
          )
        ]
      )
    );
  }
}
