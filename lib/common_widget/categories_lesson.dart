import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryLesson extends StatelessWidget {
  final String titleCategory;
  final String typeLesson;
  final String time;
  const CategoryLesson(
      {super.key,
      required this.titleCategory,
      required this.typeLesson,
      required this.time});
  @override
  Widget build(BuildContext context) {
    Color yelSchema = Theme.of(context).colorScheme.onSecondary;
    Color greySchema = Theme.of(context).colorScheme.onSurface;
    TextStyle? titleStyle = Theme.of(context).textTheme.headline3;
    TextStyle? subStyle =
        Theme.of(context).textTheme.subtitle1!.copyWith(color: yelSchema);
    String thumbnail =
        'https://res.cloudinary.com/dwu92ycra/image/upload/v1700814685/Gym-app/Image_9_tsghiv.png';
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
          height: 86,
          decoration: BoxDecoration(
              color: greySchema, borderRadius: BorderRadius.circular(20)),
          constraints: const BoxConstraints(
            minHeight: 82,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image(
                image: NetworkImage(thumbnail),
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$titleCategory\n$typeLesson'.toString(),
                        style: titleStyle,
                      ),
                      Text(
                        time,
                        style: subStyle,
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_drop_down))
            ],
          )),
    );
  }
}
