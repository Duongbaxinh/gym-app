import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget{
  const VideoScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _VideoScreenState();
  }

}
class _VideoScreenState extends State<VideoScreen>{
  @override
    Widget build(BuildContext context){
    return Scaffold(
      body: Text('VIDEO'),
    );
  }
}
