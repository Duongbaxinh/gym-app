import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/block/user_provider.dart';
import 'package:project_app/common_widget/button_widget.dart';
import 'package:project_app/common_widget/circle_gender.dart';
import 'package:project_app/common_widget/screen_start.dart';
import 'package:project_app/common_widget/wheel_custome.dart';
import 'package:project_app/screens/screen_infor/gender_screen.dart';
import 'package:project_app/screens/screen_infor/goal_screen.dart';
import 'package:provider/provider.dart';

class HeightScreen extends StatefulWidget{
  const HeightScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HeightScreenState();
  }
}
class _HeightScreenState extends State<HeightScreen>{
  int heightActive = 160;
  List<Widget> buildItem(BuildContext context){
    List<Widget> listItem = [];
    for(int i = 18; i< 80; i++){
      listItem.add(
          Container(
            width: 100,
            decoration: BoxDecoration(
                border: Border.symmetric(horizontal:
                heightActive == i ? BorderSide(
                    color: Theme.of(context).colorScheme.onSecondary,
                    width: 1): BorderSide.none)
            ),
            child: Center(
              child: Text(i.toString(),
                  style: (heightActive - 1 ) == i ||(heightActive +1 )  == i ?
                  Theme.of(context).textTheme.headline2 :
                  heightActive == i ? Theme.of(context).textTheme.headline1!:
                  Theme.of(context).
                  textTheme.headline3!.copyWith(fontWeight: FontWeight.w100) ),
            ),
          ));
    }
    return listItem;
  }
  void setActive(value){
    setState(() {
      heightActive = value + 160;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvide>(builder:(context, userProvide, child) =>
        ScreenStart(
            title: 'What’s your height?',
            sub1: 'This helps us create your personalized plan',
            sub2: '',
            body_widget: [
              SizedBox(
                height: 350,
                child: WheelCustom(
                  widthItem: 80,
                    start: 160,
                    end: 250,
                    active: heightActive,
                    fn: setActive),
              ),
            ],
            bottom: ButtonCustom(title: 'Next', fn:(){
              userProvide.setInfoUser('height', heightActive);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Goal(),));
            },)
        )
      ,);
  }

}

