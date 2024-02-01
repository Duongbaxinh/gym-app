import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/common_widget/button_widget.dart';

class DialogCustom extends StatelessWidget {
  final String title;
  final String content;
  final String image;
  const DialogCustom(
      {super.key,
      required this.title,
      required this.content,
      required this.image});

  @override
  Widget build(BuildContext context) {
    Color bg = Theme.of(context).colorScheme.onBackground;
    TextStyle? titleText =
        Theme.of(context).textTheme.headline2!.copyWith(color: Colors.red);
    TextStyle? contentText =
        Theme.of(context).textTheme.headline4!.copyWith(color: Colors.red);
    return AlertDialog(
      // title: Text(title,style:titleText ,),
      content: SizedBox(
        height: 250,
        child: Column(
          children: [
            SizedBox(
                width: 100,
                height: 100,
                child: Image(image: AssetImage(image!))),
            Text(
              content.toUpperCase(),
              style: contentText,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: ButtonCustom(
                  title: 'Cancel',
                  icon: false,
                  fn: () {
                    Navigator.pop(context);
                  }),
            )
          ],
        ),
      ),
      backgroundColor: bg,
      contentPadding: const EdgeInsets.all(15),
      elevation: 20,
      shadowColor: Colors.red,
    );
  }
}
