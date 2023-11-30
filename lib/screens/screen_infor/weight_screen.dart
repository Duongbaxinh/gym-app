import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/block/user_provider.dart';
import 'package:project_app/common_widget/button_widget.dart';
import 'package:project_app/common_widget/screen_start.dart';
import 'package:project_app/common_widget/wheel_custome.dart';
import 'package:project_app/screens/screen_infor/height_screen.dart';
import 'package:provider/provider.dart';

class Weight extends StatefulWidget{
  const Weight({super.key});

  @override
  State<StatefulWidget> createState() {
  return _WeightState();
  }
}
class _WeightState extends State<Weight>{
  int weightActive = 40;
  void setWeightActive(value){
    setState(() {
      weightActive = value ;
    });
  }
  String we =  '⎯'*160;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Consumer<UserProvide>(builder: (context, userProvider, child) =>
       ScreenStart(
         title: 'What’s your weight?',
         sub1: 'You can always change this later',
         sub2: '',
         body_widget:[
           Text((weightActive + 40).toString(),
             style: Theme.of(context).textTheme.headline1,),
           RotatedBox(
             quarterTurns: -1,
             child: SizedBox(
               height: 500,
               width: 100,
               child: WheelCustom(
                 widthItem: 80,
                 type: we.split(''),
                 start: 0,
                 end:80,
                 active: weightActive,
                 fn: setWeightActive
         ),
             ),
           ),],
         bottom:  Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
             ButtonCustom(title: 'Next', fn: (){
               userProvider.setInfoUser('weight', weightActive+40);
               Navigator.push(context, MaterialPageRoute(builder: (context) => const HeightScreen(),));
             }
             )
           ],),),
          ),
   );
  }

}