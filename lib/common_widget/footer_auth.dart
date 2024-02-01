import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/common_widget/button_widget.dart';
import 'package:project_app/common_widget/custom_icon_button.dart';

class FooterAuth extends StatelessWidget{
  final VoidCallback fn1;
  final VoidCallback fn2;
  final VoidCallback fn3;
  final String titleButton;
  const FooterAuth({super.key,required this.fn1, required this.fn2,required this.fn3,required this.titleButton});
  @override
  Widget build(BuildContext context){
    const iconApple = 'https://res.cloudinary.com/dwu92ycra/image/upload/v1700655429/Gym-app/icon_apple_z0vpi1.png';
    const iconGoogle = 'https://res.cloudinary.com/dwu92ycra/image/upload/v1700655429/Gym-app/icon_google_ag3ink.png';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         IconButtonCustom(imageIcon: iconApple, fn: (){}),
          const SizedBox(width: 40,),
          IconButtonCustom(imageIcon: iconGoogle, fn: (){}),
        ],
      ),
        ButtonCustom(title: titleButton, fn: fn3)
      ],
    );
  }
}