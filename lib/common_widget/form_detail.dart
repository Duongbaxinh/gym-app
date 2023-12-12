import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/common_widget/button_widget.dart';
import 'package:project_app/common_widget/categories_lesson.dart';
import 'package:project_app/common_widget/custome_icon_button.dart';
import 'package:project_app/constant/image_icon.dart';
import 'package:project_app/constant/index.dart';
import 'package:project_app/util/show_take_appointment.dart';

Map<String,dynamic> warmUp = {
  "name":"Day 1 - Warm Up",
  "describe":"04 Workouts for Beginner",
  "description":'''Want your body to be healthy. Join our program with directions according to body’s goals. Increasing physical strength is the goal of strenght training. Maintain body fitness by doing physical exercise at least 2-3 times a week. ''',
  "allTime":"60",
  "allCalo":"350",
  "numberOfLesson":"2",
  "image":"https://res.cloudinary.com/dwu92ycra/image/upload/v1700896412/Gym-app/Image_11_tisyhe.png",
  "lessons":<Map<String,dynamic>>[
    {"nameLesson":"Simple Warm-Up",
      "level": "Exercises",
      "timeLesson":"0:30",
      "thumbnail" :"https://res.cloudinary.com/dwu92ycra/image/upload/v1700896678/Gym-app/Image_13_ynosqy.png",
      "video":""
    },
    {"nameLesson":"Simple Warm-Up",
      "level": "Exercises",
      "timeLesson":"1:00",
      "thumbnail" :"https://res.cloudinary.com/dwu92ycra/image/upload/v1700896677/Gym-app/Image_12_el3xmq.png",
      "video":""
    }
  ]
};
class DetailScreen extends StatelessWidget{
  final dynamic body;
  final dynamic footer;
  final String background;
  final double aspect;
  final double height;
  const
  DetailScreen({required this.body, this.footer,super.key,
    required this.background,
    required this.aspect, required this.height});
  @override
  Widget build(BuildContext context){
    List<Map<String,dynamic>> lessons = warmUp['lessons'];
    Color yelSchema = Theme.of(context).colorScheme.onSecondary;
    TextStyle? titleStyle = Theme.of(context).textTheme.headline4;
    TextStyle subStyle = Theme.of(context).textTheme.subtitle1!.copyWith(color: yelSchema);
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          AspectRatio(
            aspectRatio: aspect,
            child: Container(
              padding: const EdgeInsets.only(top: 50,left: 15),
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(background),fit: BoxFit.cover)
              ),
              child: Align(
                  alignment: Alignment.topLeft,
                  child:
                CustomeIconButton(imageIcon: arrowLeft,fn:(){},),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - height,
              padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 20),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  color: Color.fromARGB(255, 28, 28, 30)
              ),
              child:body,
            ),
          ),
          if(footer != null) footer
        ],
      ),
    );
  }
}
