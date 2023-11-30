import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/common_widget/button_widget.dart';

class BottomButton extends StatelessWidget{
  final VoidCallback fn;
  final String title;
  final double? heightOver;
  const BottomButton({super.key,required this.fn, required this.title,this.heightOver});
  @override
  Widget build(BuildContext context){
    return     Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: heightOver ?? 150,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.transparent
                ],
                stops: [0.3, 0.9]
            )
        ),
        child: Center(child:
        SizedBox(
          width: 250,
          height: 60,
          child: ButtonCustom(
              icon: false,
              title: title, fn:fn),
        )
        ),
      ),
    );
  }
}