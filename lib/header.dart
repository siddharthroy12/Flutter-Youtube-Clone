import 'package:flutter/material.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  const Header({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
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
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(2)),
                        color: Theme.of(context).colorScheme.surfaceTint,
                      ),
                      height: 40,
                      child: Row(
                        children: [
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                  bottom: 10,
                                  left: 10,
                                  right: 10
                                )
                              )
                            )
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.outline
                            ),
                            child: SizedBox(
                              width: 70,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search,
                                  color: Theme.of(context).iconTheme.color
                                )
                              )
                            )
                          )
                        ]
                      )
                    )
                  )
                ),
                const SizedBox(width: 10),
                Ink(
                  decoration: ShapeDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    shape: const CircleBorder()
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mic_outlined,
                      color: Theme.of(context).iconTheme.color
                    ),
                  )
                )
              ]
            )
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    color: Theme.of(context).iconTheme.color
                  )
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_outlined,
                    color: Theme.of(context).iconTheme.color
                  )
                ),
                const SizedBox(width: 10),
                IconButton(
                  iconSize: 30,
                  onPressed: () {},
                  icon: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "assets/profile_picture.png",
                    )
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
