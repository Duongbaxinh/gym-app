import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/block/models/work_plan_model.dart';
import 'package:project_app/block/user_provider.dart';
import 'package:project_app/block/workout_plan_provider.dart';
import 'package:project_app/common_widget/card_lesson.dart';
import 'package:project_app/screens/detail_lesson_screen.dart';
import 'package:project_app/screens/submit_screen.dart';
import 'package:provider/provider.dart';

class Recommend extends StatelessWidget{
  const Recommend({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvide>(context);
    return  Consumer<WorkOutPlanProvider>(
        builder: (BuildContext context, WorkOutPlanProvider workoutCategory,
            Widget? child)=>
            FutureBuilder<void>(future: workoutCategory.init(),
              builder: (context, snapshot){
                List<WorkPlanModel> workPlanCategories = workoutCategory.workPlanCategories;
                return
                  Column(
                    children: [
                      !workoutCategory.isLoading ?
                      SizedBox(
                        height: 180,
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () async{
                                if(workPlanCategories[index].state == 'publish' ){
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailLessonScreen(workPlanModel: workPlanCategories[index]),));
                                }
                              },
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(15)),
                                child: CardLesson(
                                    state:workPlanCategories[index].state ,
                                    titleLesson:
                                    workPlanCategories[index].namePlan,
                                    subLesson:
                                    workPlanCategories[index].timeDetail,
                                    thumbnail:
                                    workPlanCategories[index].thumbnail),
                              ),
                            ),
                            separatorBuilder: (context, index) =>  const SizedBox(width: 10, height: 20),
                            itemCount: workPlanCategories.length),
                      )
                          : const CircularProgressIndicator()
                    ],
                  );
              },)

    );
  }

}