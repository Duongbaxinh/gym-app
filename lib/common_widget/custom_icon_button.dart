import 'package:flutter/material.dart';
class IconButtonCustom extends StatelessWidget{
  final String imageIcon;
  final VoidCallback fn;
  const IconButtonCustom({super.key, required this.imageIcon, required this.fn});
  @override
  Widget build(BuildContext context){
    return  Container(
      width: 50,
      height: 50,
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