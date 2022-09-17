import 'package:flutter/material.dart';
import './header.dart';
import './sidebar.dart';

const topics = [
  "All",
  "Mixes",
  "Music",
  "Gaming",
  "KSI",
  "Live",
  "Manga",
  "Markiplier",
  "Computer Science",
  "Electrical Engineering",
  "Podcasts",
];

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
          MediaQuery.of(context).size.width > 500 ? (SideBar(
            showMini: MediaQuery.of(context).size.width < 1300 ? true : !expandSidebar,
            scaffoldKey: _scaffoldKey
          )) : Container(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Theme.of(context).colorScheme.outline
                      ),
                    )
                  ),
                  height: 55,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 10);
                    },
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: topics.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Chip(
                        label: Text(topics[index]),
                      );
                    },
                  ),
                )
              ]
            )
          )
        ]
      )
    );
  }
}
