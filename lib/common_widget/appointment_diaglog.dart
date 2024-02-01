import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/common_widget/button_widget.dart';
import 'package:project_app/common_widget/card_lesson.dart';

class AppointmentDialog extends StatelessWidget {
  final String title;
  final String sub;
  final String thumbnail;
  final String titleButton;
  final String? state;
  final bool icon;
  final VoidCallback fn;
  const AppointmentDialog(
      {super.key,
      required this.title,
      required this.sub,
      required this.thumbnail,
      required this.fn,
        required this.titleButton,
        this.icon = true,
        this.state});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: 
      Container(
        constraints: const BoxConstraints(
          minHeight: 322,
          maxHeight: 350,
          minWidth: 450
        ),
        child: AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: const EdgeInsets.all(0),
          shadowColor: Colors.red,
          actions: [
            Center(child: ButtonCustom(title: titleButton, fn: fn,icon:icon)),
            const SizedBox(height: 15,),
            Container(
              padding: const EdgeInsets.only(bottom: 15),
              child: Center(child: TextButton(onPressed: () {
                Navigator.pop(context,'Cancel');
              },
                  child:  Text('Cancel',
                    style: Theme.of(context).textTheme.headline4,))),
            )
          ],
          content: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: CardLesson(
                  state: state ?? '',
                    titleLesson: title, subLesson: sub, thumbnail: thumbnail),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
