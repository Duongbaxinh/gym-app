import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/block/user_provider.dart';
import 'package:project_app/common_widget/button_widget.dart';
import 'package:project_app/common_widget/screen_start.dart';
import 'package:project_app/common_widget/wheel_custome.dart';
import 'package:project_app/screens/screen_infor/level_screen.dart';
import 'package:provider/provider.dart';

class Goal extends StatefulWidget{
  const Goal({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GoalState();
  }
}
class _GoalState extends State<Goal>{
  int goalActive = 0;
  void setGoalActive(value){
    setState(() {
      goalActive = value ;
    });
  }
  List<String> goal = ['Lose weight','Gain more flexible','Gain Weight','Learn the basic','Get fitter'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserProvide>(builder: (context, userProvider, child) =>
          ScreenStart(
            title: 'What’s your weight?',
            sub1: 'You can always change this later',
            sub2: '',
            body_widget:[
              SizedBox(
                height: 350,
                child: WheelCustom(
                    type: goal,
                    start: 0,
                    end:goal.length,
                    active: goalActive,
                    fn: setGoalActive,
                ),
              ),],
            bottom:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
                ButtonCustom(title: 'Next', fn: (){
                  userProvider.setInfoUser('goal', goal[goalActive]);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Level(),));
                }
                )
              ],),),
      ),
    );
  }

}