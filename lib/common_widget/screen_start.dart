import 'package:flutter/material.dart';

class ScreenStart extends StatelessWidget{
  final String title;
  final String sub1;
  final String sub2;
  final List<Widget> body_widget ;
  final Widget bottom;
  const ScreenStart({
    super.key,
    required this.sub1, required this.sub2,
    required this.body_widget,
    required this.bottom, required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children:[
              Text(title.toUpperCase(),style: Theme.of(context).textTheme.headline3,textAlign: TextAlign.center,),
              const SizedBox(height: 10,),
              Text(sub1.toUpperCase(),style: Theme.of(context).textTheme.subtitle2 ,),
              Text(sub2.toUpperCase(),style: Theme.of(context).textTheme.subtitle2 ,)
            ]!,
          ),
          Column(
            children:body_widget!,
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: bottom!),
        ],

      ),
    );
  }

}