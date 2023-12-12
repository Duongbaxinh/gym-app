
import 'package:flutter/material.dart';
import 'package:project_app/block/models/work_plan_model.dart';
import 'package:project_app/block/user_provider.dart';
import 'package:project_app/block/workout_plan_provider.dart';
import 'package:project_app/common_widget/card_lesson.dart';
import 'package:project_app/common_widget/group_button.dart';
import 'package:project_app/screens/detail_lesson_screen.dart';
import 'package:project_app/screens/submit_screen.dart';
import 'package:provider/provider.dart';

class WorkOutCategory extends StatelessWidget {
  final Axis scrollDirection;
  final double? height;
  const WorkOutCategory(
      {super.key, this.scrollDirection = Axis.horizontal, this.height});
  @override
  Widget build(BuildContext context) {
    final workoutProvider = Provider.of<WorkOutPlanProvider>(context);
    final userProvider = Provider.of<UserProvide>(context);
    return Consumer<WorkOutPlanProvider>(
      builder: (BuildContext context, WorkOutPlanProvider workoutCategory,
              Widget? child)=>
          FutureBuilder<void>(future: workoutProvider.init(),
              builder: (context, snapshot){
            List<WorkPlanModel> workPlanCategories = workoutProvider.workPlanCategories;
                  return
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          height: 50,
                          child: GroupButtonCustom(
                            initSelected: workoutProvider.currentCategory,
                              fn: (value) {
                                workoutProvider.listLesson(value);
                              },
                              listButton: const ['Beginner', 'Intermediate', 'Advance']),
                        ),
                        !workoutProvider.isLoading ?
                          SizedBox(
                          height: height,
                          child: ListView.separated(
                          shrinkWrap: scrollDirection != null ? true : false,
                          scrollDirection: scrollDirection,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () async{
                                Map<String,dynamic> infoUser = await userProvider.getUserInfo('userInfo');
                              if(workPlanCategories[index].state == 'publish' || infoUser['premium']){
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailLessonScreen(workPlanModel: workPlanCategories[index]),));
                              }
                              if(workPlanCategories[index].state != 'publish' || !infoUser['premium']){
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SubmitScreen(),));
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
