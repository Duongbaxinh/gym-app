import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _TestState();
  }

}
class _TestState extends State<Test>{
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
      setState(() {
        count = count + 1;
      });
    }, child: Text('presss $count'));
  }

}