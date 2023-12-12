import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChipCustom extends StatelessWidget{
  final String label;
  final Color color;
  const ChipCustom({super.key,required this.label, this.color = Colors.yellow});
  @override
  Widget build(BuildContext context){
    TextStyle labelStyle = Theme.of(context).textTheme.subtitle1!;
    return SizedBox(
      width: 45,
      height: 25,
      child: Chip(label:Text(label,style: labelStyle.copyWith(color: Colors.black,height: 0.5),),
        backgroundColor: color,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        padding: const EdgeInsets.all(0),
      )
    );
  }
}