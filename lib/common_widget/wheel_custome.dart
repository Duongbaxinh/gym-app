
import 'package:flutter/material.dart';

class WheelCustom extends StatelessWidget{
  final int start;
  final int end;
  final int active;
  final double? widthItem;
  final List<String>?type;
  final void Function(int) fn;

  WheelCustom({super.key,
    required this.start,
    required this.end,
    required this.active,
    required this.fn,
    this.type, this.widthItem
  });

  Map<String ,dynamic> listBody = {
    "goal":['Lose weight','Gain more flexible','Gain Weight','Learn the basic','Get fitter'],
    "level":['Beginner','Advance','Rookie','True Beast','Intermediate'],
  };

  List<Widget> buildItem(BuildContext context){
    List<Widget> listItem = [];
    for(int i = start; i< end; i++){
      listItem.add(
          Container(
            width: widthItem,
            decoration: BoxDecoration(
                border: Border.symmetric(horizontal:
                active == i ? BorderSide(
                    color: Theme.of(context).colorScheme.onSecondary,
                    width: 1): BorderSide.none)
            ),
            child: Center(
              child: Text( type != null ? type![i].trim() : i.toString(),
                  style:(active - 1 ) == i ||(active +1 )  == i ?
                  Theme.of(context).textTheme.headline2 :
                  active == i ? Theme.of(context).textTheme.headline2!:
                  Theme.of(context).
                  textTheme.headline3!.copyWith(fontWeight: FontWeight.w100) ),
            ),
          ));
    }
    return listItem;
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: ListWheelScrollView(
         onSelectedItemChanged: (value) => fn(value),
         diameterRatio: 5,
         itemExtent: 45,
         perspective: 0.01,
         physics: const FixedExtentScrollPhysics(),
         useMagnifier: true,
         magnification: 1.4,
         children: buildItem(context,)),
   );
  }

}

