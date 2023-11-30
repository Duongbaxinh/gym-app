import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogCustome extends StatelessWidget{
  final String title;
  final String content;

  const DialogCustome({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context){
    Color yel = Theme.of(context).colorScheme.secondary;
    TextStyle? titleText = Theme.of(context).textTheme.headline2!.copyWith(color: Colors.red);
    TextStyle? contentText = Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black);
    return AlertDialog(
      // title: Text(title,style:titleText ,),
      content: Text(content.toUpperCase(),style: contentText,textAlign: TextAlign.center,),
      backgroundColor: yel,
      contentPadding: EdgeInsets.all(15),
      elevation: 20,
      shadowColor: Colors.red,
      actions: [
        Text('Login'),
        Text('Cancel')
      ],
    );
  }
}