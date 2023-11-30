import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardLesson extends StatelessWidget {
  final String titleLesson;
  final String subLesson;
  final String thumbnail;
  const CardLesson({
    super.key,
    required this.titleLesson,
    required this.subLesson,
    required this.thumbnail});

  @override
  Widget build(BuildContext context) {
    Color yellowSchema = Theme.of(context).colorScheme.onSecondary;
    TextStyle? titleStyle = Theme.of(context).textTheme.headline4;
    TextStyle? subStyle =
        Theme.of(context).textTheme.subtitle1!.copyWith(color: yellowSchema);
    return AspectRatio(
      aspectRatio: 327 / 160,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(thumbnail),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: ListTile(
            title: Text(
              titleLesson ?? 'Day 01 - Warm Up',
              style: titleStyle!,
            ),
            subtitle: Text(
             '| $subLesson',
              style: subStyle!,
            ),
          ),
        ),
      ),
    );
  }
}
