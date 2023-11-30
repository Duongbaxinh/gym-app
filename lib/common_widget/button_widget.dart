import 'package:flutter/material.dart';
class ButtonCustom extends StatelessWidget{
  final String title;
  final VoidCallback fn;
  final bool icon;
  const ButtonCustom({super.key,required this.title,required this.fn,
     this.icon = true});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ElevatedButton(
          onPressed: fn,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
          ),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 8,horizontal: 10)),
          backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.onSecondary,
          )
        ),
        child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text(title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
          if(icon)const Icon(Icons.arrow_right,size:35,)
        ],
        ),

      ),
    );
  }

}