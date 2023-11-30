import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/block/user_provider.dart';
import 'package:project_app/common_widget/button_widget.dart';
import 'package:project_app/common_widget/circle_gender.dart';
import 'package:project_app/common_widget/screen_start.dart';
import 'package:project_app/common_widget/wheel_custome.dart';
import 'package:project_app/screens/screen_infor/gender_screen.dart';
import 'package:project_app/screens/screen_infor/weight_screen.dart';
import 'package:provider/provider.dart';

class AgeScreen extends StatefulWidget{
  const AgeScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _AgeScreenState();
  }
}
class _AgeScreenState extends State<AgeScreen>{
   int ageActive = 18;
  List<Widget> buildItem(BuildContext context){
    List<Widget> listItem = [];
    for(int i = 18; i< 80; i++){
      listItem.add(
          Container(
            width: 100,
            decoration: BoxDecoration(
              border: Border.symmetric(horizontal:
              ageActive == i ? BorderSide(
                  color: Theme.of(context).colorScheme.onSecondary,
              width: 1): BorderSide.none)
            ),
            child: Center(
              child: Text(i.toString(),
                style: (ageActive - 1 ) == i ||(ageActive +1 )  == i ?
                Theme.of(context).textTheme.headline2 :
                ageActive == i ? Theme.of(context).textTheme.headline1!:
                Theme.of(context).
                textTheme.headline3!.copyWith(fontWeight: FontWeight.w100) ),
            ),
          ));
    }
    return listItem;
  }
  void setActive(value){
    setState(() {
      ageActive = value + 18;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvide>(builder:(context, userProvide, child) =>
        Scaffold(
          body: ScreenStart(
            title: 'How old are you ?',
            sub1: 'This helps us create your personalized plan',
            sub2: '',
            body_widget: [
             Container(
               color: Colors.black,
               width: MediaQuery.of(context).size.width,
               height: 400,
               child: WheelCustom(
                   start: 18,
                   widthItem: 80,
                   end: 80,
                   active: ageActive,
                   fn: setActive),
             ),
            ],
            bottom: ButtonCustom(title: 'Next', fn:(){
              userProvide.setInfoUser('age', ageActive);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Weight(),));
            },)
          ),
        )
      ,);
  }

}

