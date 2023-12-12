import 'package:flutter/material.dart';
import 'package:project_app/block/user_provider.dart';
import 'package:project_app/common_widget/button_widget.dart';
import 'package:project_app/common_widget/circle_gender.dart';
import 'package:project_app/common_widget/screen_start.dart';
import 'package:project_app/screens/screen_infor/age_screen.dart';
import 'package:provider/provider.dart';

class Gender extends StatefulWidget{
  const Gender({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GenderState();
  }
}
class _GenderState extends State<Gender>{
  int gender = 0;
  void setGender(int value){
    setState(() {
      gender = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserProvide>(
        builder: (context, userProvide, child) => Center(
          child:ScreenStart(
            title: 'Tell us about yourself',
            sub1: 'To give you a better experience we need',
            sub2: 'to know your gender'
            ,
            body_widget: [
              CircleGender(
                  active: gender == 0,
                  fn:(){ setGender(0); },
                  title: 'Male',
                  icon: 'https://res.cloudinary.com/dwu92ycra/image/upload/v1700318773/Gym-app/male_kpfyuh.png'
              ),
              const SizedBox(height: 30,),
              CircleGender(
                  active: gender == 1,
                  fn:(){ setGender(1); },
                  title: 'Female',
                  icon: 'https://res.cloudinary.com/dwu92ycra/image/upload/v1700318773/Gym-app/female_bc4pmp.png'
              )
            ],
            bottom: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
                ButtonCustom(title: 'Next', fn: (){
                  userProvide.setInfoUser('gender', gender == 0 ? 'Male' : 'Female');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AgeScreen(),));
                }
                )
              ],),)          ,
        ),
      ),
    );
  }
}