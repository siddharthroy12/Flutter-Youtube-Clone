import 'package:flutter/material.dart';

const subscriptions = [
  ["Flutter", "flutter.jpg"],
  ["Markiplier", "markiplier.jpg"],
  ["Muse Asia", "museasia.jpg"],
  ["Fireship", "fireship.jpg"],
  ["Neetcode", "neetcode.jpg"],
];

class ListSectionHeader extends StatelessWidget {
  const ListSectionHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: Theme.of(context).textTheme.headline4)
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.leading,
    required this.text,
    required this.onTap,
    this.mini=false
  });

  final Widget leading;
  final String text;
  final void Function() onTap;
  final bool mini;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: mini ? ListTile(
          contentPadding: mini ? EdgeInsets.all(0) : null,
          title: Padding(padding: const EdgeInsets.symmetric(vertical: 20), child: Column(
            children: [
              leading,
              const SizedBox(height: 3),
              Text(
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w300
                ),
                text
              )
            ]
          ))
        ) : ListTile(
          onTap: onTap,
          leading: leading ,
          title: Text(
            style: const TextStyle(
              fontWeight: FontWeight.w300
            ),
            text
          )
        )
      )
    );
  }
}

class SideBar extends StatelessWidget {
  const SideBar({super.key, this.showMini=false, this.showBanner=false, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool showMini;
  final bool showBanner;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: showMini ? 75 : 240,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor
        ),
        child: ListView(
          children: (showBanner ? <Widget> [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal:15),
              height: 56.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: scaffoldKey.currentState!.closeDrawer,
                    icon: Icon(
                      Icons.menu,
                      color: Theme.of(context).iconTheme.color
                    )
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 12.0),
                    child: const Image(image: AssetImage("assets/logo.png"), width: 90.0, isAntiAlias: true,)
                  )
                ],
              )
            )
          ] : <Widget>[]) + [
            ListItem(
              text: "Home",
              leading: const Icon(Icons.home),
              onTap: () {},
              mini: showMini
            ),
            ListItem(
              text: "Explore",
              leading: const Icon(Icons.explore_outlined),
              onTap: () {},
              mini: showMini
            ),
            ListItem(
              text: "Shorts",
              leading: const Icon(Icons.app_shortcut_outlined),
              onTap: () {},
              mini: showMini
            ),
            ListItem(
              text: "Subscriptions",
              leading: const Icon(Icons.subscriptions_outlined),
              onTap: () {},
              mini: showMini
            ),
            (showMini ? Container() : const Divider()),
            ListItem(
              text: "Library",
              leading: const Icon(Icons.video_library_outlined),
              onTap: () {},
              mini: showMini
            ),
          ] + (showMini ? [] : [
            ListItem(
              text: "History",
              leading: const Icon(Icons.history_outlined),
              onTap: () {},
              mini: showMini
            ),
            ListItem(
              text: "Your videos",
              leading: const Icon(Icons.video_library_outlined),
              onTap: () {},
              mini: showMini
            ),
            ListItem(
              text: "Show more",
              leading: const Icon(Icons.keyboard_arrow_down_outlined),
              onTap: () {},
              mini: showMini
            ),
            const Divider(),
            const ListSectionHeader(title: "SUBSCRIPTIONS"),
            ListView.builder(
              shrinkWrap: true,
              itemCount: subscriptions.length,
              itemBuilder: (BuildContext context, int index) {
                return ListItem(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/profile_pictures/${subscriptions[index][1]}',
                      width: 25,
                      height: 25
                    )
                  ),
                  text: subscriptions[index][0],
                  onTap: () {},
                );
              }
            ),
            ListItem(
              text: "Show more",
              leading: const Icon(Icons.keyboard_arrow_down_outlined),
              onTap: () {}
            ),
            const Divider(),
            ListItem(
              text: "Settings",
              leading: const Icon(Icons.settings_outlined),
              onTap: () {}
            ),
          ])
        )
      )
    );
  }
}
