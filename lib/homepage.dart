import 'package:flutter/material.dart';
import './header.dart';
import './sidebar.dart';
import './topics.dart';

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
    int crossAxisCount = 4;
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 500) {
      crossAxisCount = 1;
    } else if (screenWidth < 900) {
      crossAxisCount = 2;
    } else if (screenWidth < 1200) {
      crossAxisCount = 3;
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: Header(onMenuTap: toggleSidebar),
      drawer: SideBar(showBanner: true, scaffoldKey: _scaffoldKey),
      body: Row(
        children: [
          MediaQuery.of(context).size.width > 500 ? (SideBar(
            showMini: MediaQuery.of(context).size.width < 1300 ? true : !expandSidebar,
            scaffoldKey: _scaffoldKey
          )) : Container(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Topics(),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(22),
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: const BoxDecoration(
                        ),
                        child: Column(
                          children: [
                            const Image(image: AssetImage("assets/thumbnails/flutter_stack.webp")),
                            const SizedBox(height: 15),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.asset(
                                      'assets/profile_pictures/flutter.jpg',
                                       width: 36,
                                       height: 36
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text("Stack (Flutter Widget of the Week)"),
                                        const SizedBox(height: 10),
                                        Text("Flutter", style: Theme.of(context).textTheme.titleSmall),
                                        const SizedBox(height: 5),
                                        Text("24K views • 4 months ago", style: Theme.of(context).textTheme.titleSmall)
                                      ]
                                    )
                                  )
                                ]
                              )
                            )
                          ]
                        )
                      );
                    },
                  )
                )
              ]
            )
          )
        ]
      )
    );
  }
}
