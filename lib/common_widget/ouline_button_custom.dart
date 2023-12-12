import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OutlinebuttonCustom extends StatelessWidget{
  final String title;
  final Color color;
  final VoidCallback fn;

  const OutlinebuttonCustom({super.key, required this.title, required this.fn,  this.color = Colors.black});
  @override
  Widget build(BuildContext context){
    Color yelSchema = Theme.of(context).colorScheme.onSecondary;
    TextStyle subTitle = Theme.of(context).textTheme.headline4!;
    return   OutlinedButton(onPressed:fn, child: Text(title,style: subTitle,),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        side: BorderSide(
            color: color,
            width: 1),
      ),
    );
  }
}