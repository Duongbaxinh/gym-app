import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardNewWorkout extends StatelessWidget{
  final String title;
  final String sub;
  final String thumbnail;
  final void Function(String) fn;
  CardNewWorkout({
    super.key,
    required this.title,
    required this.sub,
    required this.thumbnail,
    required this.fn});
  @override
  Widget build(BuildContext context){
    Color yelSchema = Theme.of(context).colorScheme.onSecondary;
    TextStyle titleStyle = Theme.of(context).textTheme.headline4!;
    TextStyle subStyle = Theme.of(context).textTheme.subtitle1!.copyWith(color: yelSchema);
    return Container(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
              height: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Image(image: NetworkImage(thumbnail),fit: BoxFit.cover,))),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text(title,style: titleStyle,),
            subtitle: Text(sub ?? 'unknown',style: subStyle,) ,
          )
        ],
      ),
    );
  }
}