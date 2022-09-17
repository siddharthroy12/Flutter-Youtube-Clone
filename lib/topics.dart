import 'package:flutter/material.dart';

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

class Topics extends StatelessWidget {
  const Topics({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
