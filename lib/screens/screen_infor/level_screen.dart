import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/block/user_provider.dart';
import 'package:project_app/common_widget/button_widget.dart';
import 'package:project_app/common_widget/screen_start.dart';
import 'package:project_app/common_widget/wheel_custome.dart';
import 'package:project_app/screens/screen_auth/auth_screen.dart';
import 'package:provider/provider.dart';

class Level extends StatefulWidget{
  const Level({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LevelState();
  }
}
class _LevelState extends State<Level>{
  int levelActive = 0;
  void setLevelActive(value){
    setState(() {
      levelActive = value ;
    });
  }
  List<String> level = ['Beginner','Advance','Rookie','True Beast','Intermediate'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserProvide>(builder: (context, userProvider, child) =>
          ScreenStart(
            title: 'Your regular physical activity level?',
            sub1: 'This helps us create your personalized plan',
            sub2: '',
            body_widget:[
              SizedBox(
                height: 350,
                child: WheelCustom(
                  // widthItem: MediaQuery.of(context).size.width,
                    type: level,
                    start: 0,
                    end:level.length,
                    active: levelActive,
                    fn: setLevelActive
                ),
              ),],
            bottom:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
                ButtonCustom(title: 'Next', fn: (){
                  userProvider.setInfoUser('level', level[levelActive]);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AuthScreen(),));
                }
                )
              ],),),
      ),
    );
  }

}