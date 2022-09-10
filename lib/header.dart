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
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: null,
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
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(2)),
                color: Theme.of(context).colorScheme.surfaceTint
              ),
              height: 40,
              padding: const EdgeInsets.all(0),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
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
                          onPressed: null,
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
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Ink(
                    decoration: ShapeDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      shape: const CircleBorder()
                    ),
                    child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.mic,
                        color: Theme.of(context).iconTheme.color
                      ),
                    )
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.camera_alt,
                          color: Theme.of(context).iconTheme.color
                        )
                      ),
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.notifications,
                          color: Theme.of(context).iconTheme.color
                        )
                      ),
                    ]
                  )
                ]
              )
            )
          )
        ]
      )
    );
  }
}
