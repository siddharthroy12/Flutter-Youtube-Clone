import 'package:flutter/material.dart';

const subscriptions = [
  ["Flutter", "flutter.jpg"],
  ["Markiplier", "markiplier.jpg"],
  ["Muse Asia", "museasia.jpg"],
  ["Fireship", "fireship.jpg"],
  ["Neetcode", "neetcode.jpg"],
];

class ListHeader extends StatelessWidget {
  const ListHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: Theme.of(context).textTheme.headline4)
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.leading, required this.text, required this.onTap});

  final Widget leading;
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: ListTile(
          onTap: onTap,
          leading: leading,
          title: Text(text)
        )
      )
    );
  }
}

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor
        ),
        child: ListView(
          children: [
            ListItem(
              text: "Home",
              leading: const Icon(Icons.home_outlined),
              onTap: () {}
            ),
            ListItem(
              text: "Explore",
              leading: const Icon(Icons.explore_outlined),
              onTap: () {}
            ),
            ListItem(
              text: "Shorts",
              leading: const Icon(Icons.app_shortcut_outlined),
              onTap: () {}
            ),
            ListItem(
              text: "Subsscriptions",
              leading: const Icon(Icons.subscriptions_outlined),
              onTap: () {}
            ),
            const Divider(),
            ListItem(
              text: "Library",
              leading: const Icon(Icons.video_library_outlined),
              onTap: () {}
            ),
            ListItem(
              text: "History",
              leading: const Icon(Icons.history_outlined),
              onTap: () {}
            ),
            ListItem(
              text: "Your videos",
              leading: const Icon(Icons.video_library_outlined),
              onTap: () {}
            ),
            ListItem(
              text: "Show more",
              leading: const Icon(Icons.keyboard_arrow_down_outlined),
              onTap: () {}
            ),
            const Divider(),
            const ListHeader(title: "SUBSCRIPTIONS"),
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
            const ListHeader(title: "EXPLORE"),
          ]
        )
      )
    );
  }
}
