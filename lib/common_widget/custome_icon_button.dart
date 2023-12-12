import 'package:flutter/material.dart';
class CustomeIconButton extends StatelessWidget{
  final String imageIcon;
  final VoidCallback fn;
  const CustomeIconButton({super.key, required this.imageIcon, required this.fn});
  @override
  Widget build(BuildContext context){
    return  Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.onSecondaryContainer
      ),
      child: IconButton(
        hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          color: Colors.white,
          onPressed: ()=>{Navigator.pop(context)},
          icon:ImageIcon(NetworkImage(imageIcon))
      ),
    );
  }
}