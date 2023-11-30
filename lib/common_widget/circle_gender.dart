import 'package:flutter/material.dart';

class CircleGender extends StatelessWidget{
  final bool active;
  final String title;
  final String icon;
  final VoidCallback fn;
  const CircleGender({
    super.key,
    required this.active,
    required this.fn,
    required this.title,
    required this.icon});
  @override
  Widget build(BuildContext context) {
    Color yellow = Theme.of(context).colorScheme.onSecondary;
    Color dark =  Theme.of(context).colorScheme.onSurface;
   return
     InkWell(
       overlayColor: MaterialStateProperty.all(Colors.transparent),
       onTap: fn,
       child: Container(
         width: 140,
         height: 140,
         decoration: BoxDecoration(
             color: active ? yellow :dark,
           shape: BoxShape.circle
         ),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             ImageIcon(NetworkImage(icon),size: 40,color: active ? dark : Colors.white ,),
             Text(title,style: Theme.of(context).textTheme.subtitle1!.copyWith(color: active ? dark : Colors.white),)
           ],
         ),
       ),
     ) ;

  }

}