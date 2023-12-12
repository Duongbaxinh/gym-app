
import 'package:flutter/material.dart';
import 'package:project_app/block/models/work_plan_model.dart';
import 'package:project_app/common_widget/bottom_button.dart';
import 'package:project_app/common_widget/categories_lesson.dart';
import 'package:project_app/common_widget/form_detail.dart';
import 'package:project_app/constant/image_icon.dart';
import 'package:project_app/util/show_take_appointment.dart';

Map<String,dynamic> warmUp = {
  "name":"Day 1 - Warm Up",
  "describe":"04 Workouts for Beginner",
  "description":'''Want your body to be healthy. Join our program with directions according to body’s goals. Increasing physical strength is the goal of strenght training. Maintain body fitness by doing physical exercise at least 2-3 times a week. ''',
  "totalTime":"60",
  "totalCalo":"350",
  "numberOfLesson":"2",
  "background":"https://res.cloudinary.com/dwu92ycra/image/upload/v1700896412/Gym-app/Image_11_tisyhe.png",
  "lessons":<Map<String,dynamic>>[
    {"nameLesson":"Simple Warm-Up",
      "typeLesson": "Exercises",
      "timeLesson":"0:30",
      "thumbnail" :"https://res.cloudinary.com/dwu92ycra/image/upload/v1700896678/Gym-app/Image_13_ynosqy.png",
      "video":""
    },
    {"nameLesson":"Simple Warm-Up",
      "typeLesson": "Exercises",
      "timeLesson":"1:00",
      "thumbnail" :"https://res.cloudinary.com/dwu92ycra/image/upload/v1700896677/Gym-app/Image_12_el3xmq.png",
      "video":""
    }
  ]
};
class DetailLessonScreen extends StatelessWidget{
  final WorkPlanModel workPlanModel;
  const DetailLessonScreen({super.key, required this.workPlanModel});
  @override
  Widget build(BuildContext context){
    List<Map<String,dynamic>> lessons = warmUp['lessons'];
    Color yelSchema = Theme.of(context).colorScheme.onSecondary;
    TextStyle? titleStyle = Theme.of(context).textTheme.headline4;
    TextStyle subStyle = Theme.of(context).textTheme.subtitle1!.copyWith(color: yelSchema);
    return Scaffold(
        body: DetailScreen(
            background: workPlanModel.background,
            aspect: 375/459,
            height: 459,
            body:      SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    visualDensity: const VisualDensity(horizontal: 0,vertical: 4),
                    title: Text(workPlanModel.namePlan.trim(),style: titleStyle,),
                    subtitle: Text(workPlanModel.describe,style: subStyle,),),
                  Row(children: [
                    Chip(avatar: ImageIcon(NetworkImage(timeIcon)) , label: Text('${workPlanModel.totalTime} min')),
                    const SizedBox(width: 50,),
                    Chip(avatar: ImageIcon(NetworkImage(calIcon)), label: Text('${workPlanModel.totalCalo} cal')),
                  ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(workPlanModel.description,maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,),
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => CategoryLesson(
                          titleCategory: workPlanModel.lessons![index].nameLesson!,
                          typeLesson: workPlanModel.lessons![index].typeLesson!,
                          time: workPlanModel.lessons![index].timeLesson!),
                      separatorBuilder: (context, index) => SizedBox(height: 10,),
                      itemCount: workPlanModel.lessons!.length )
                ],
              ),
            )  ,
            footer:
            BottomButton(
              title: 'Start Workout',
              fn: (){
                ShowAppointment(warmUp['background'],
                    warmUp['name'],
                    warmUp['describe'], () { }, context);
              },
            )

        )
    );
  }
}
