import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListTitle extends StatelessWidget{
  final String title;
  final String sub;
  final EdgeInsets?  padding;
  final void Function() fn;

  const CustomListTitle({super.key,
    this.padding,
    required this.title,
    required this.sub,
    required this.fn});

  @override
  Widget build(BuildContext context){
    Color yelSchema = Theme.of(context).colorScheme.onSecondary;
    TextStyle? titleStyle = Theme.of(context).textTheme.headline4;
    TextStyle subStyle = Theme.of(context).textTheme.subtitle1!.copyWith(color: yelSchema);
    return ListTile(
      contentPadding: padding ?? const EdgeInsets.all(0),
      leading: Text(title,style: titleStyle,),
      trailing: TextButton( onPressed: fn , child: Text(sub,style: subStyle,)),
    );
  }

}