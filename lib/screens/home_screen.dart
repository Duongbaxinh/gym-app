import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/block/lesson_provider.dart';
import 'package:project_app/block/models/trainer_model.dart';
import 'package:project_app/block/models/work_plan_model.dart';
import 'package:project_app/block/review_provider.dart';
import 'package:project_app/block/schedule_provider.dart';
import 'package:project_app/block/trainer_provider.dart';
import 'package:project_app/block/user_provider.dart';
import 'package:project_app/block/workout_plan_provider.dart';
import 'package:project_app/common_widget/card_lesson.dart';
import 'package:project_app/common_widget/custome_listTitle.dart';
import 'package:project_app/common_widget/group_button.dart';
import 'package:project_app/common_widget/new_workcount_card.dart';
import 'package:project_app/constant/list_data_start.dart';
import 'package:project_app/screens/detail_lesson_screen.dart';
import 'package:project_app/screens/detail_trainer_screen.dart';
import 'package:project_app/screens/fitness_trainers_screen.dart';
import 'package:project_app/screens/workout_category_screen.dart';
import 'package:project_app/widgetGroup/workout_category.dart';
import 'package:provider/provider.dart';

Map<String, dynamic> user = {
  "name": "Sara",
  "avatar": "",
};
Map<String, dynamic> lesson = {
  "title": "Day 01 Warm Up",
  "time": " 7:00 - 8:00",
  "thumbnail":
      "https://res.cloudinary.com/dwu92ycra/image/upload/v1700754573/Gym-app/Image_8_anwrvg.png",
  "video": "",
  "trainer": {
    "id": "",
    "name": "",
    "experiences": "",
  }
};

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String category = 'beginner';
    final workPlanProvider = Provider.of<WorkOutPlanProvider>(context);
    final trainerProvider = Provider.of<TrainerProvider>(context);
    final userProvider = Provider.of<UserProvide>(context);
    final scheduleProvider = Provider.of<ScheduleProvider>(context);
    Future<Map<String, dynamic>> getBoth() async {
      Map<String, dynamic> providerData = {};
      List<TrainerModel> trainers = await trainerProvider.getAllTrainer();
      List<WorkPlanModel> workOutPlan = await workPlanProvider.getAllWorkOut();
      // await scheduleProvider.addSchedule(schedulesData);
      Map<String, dynamic> userInfo =
          await userProvider.getUserInfo('userInfo');
      providerData['workOutPlan'] = workOutPlan;
      providerData['userInfo'] = userInfo;
      providerData['trainers'] = trainers;
      return providerData;
    }

    // ----------------------------------//
    Color yelSchema = Theme.of(context).colorScheme.onSecondary;
    TextStyle? titleStyle = Theme.of(context).textTheme.headline1;
    TextStyle subStyle =
        Theme.of(context).textTheme.headline3!.copyWith(color: yelSchema);
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Consumer<LessonProvider>(
          builder: (context, lessonProvider, child) => FutureBuilder(
              future: getBoth(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Map<String, dynamic> userInfo = snapshot.data!['userInfo'];
                  WorkPlanModel workPlanModel =
                      snapshot.data!['workOutPlan'][0];
                  List<TrainerModel> trainers = snapshot.data!['trainers'];
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: Text(
                              'Hello ${userInfo['email']}'.toUpperCase(),
                              style: titleStyle,
                            ),
                            subtitle: Text(
                              'Good morning',
                              style: subStyle,
                            ),
                          ),
                          Column(
                            children: [
                              CustomListTitle(
                                  title: 'Today work plan',
                                  sub: 'Mon 26 Apr',
                                  fn: () {}),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailLessonScreen(
                                          workPlanModel: workPlanModel,
                                        ),
                                      ));
                                },
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  child: CardLesson(
                                    state: workPlanModel.state,
                                      titleLesson: workPlanModel.namePlan,
                                      subLesson: workPlanModel.timeDetail,
                                      thumbnail: workPlanModel.thumbnail),
                                ),
                              )
                            ],
                          ),
                          CustomListTitle(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              title: 'Workout Categories',
                              sub: 'See All',
                              fn: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const WorkoutCategoriesScreen(),
                                    ));
                              }),
                          const WorkOutCategory(
                            height: 180,
                          ),
                          Column(
                            children: [
                              CustomListTitle(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  title: 'Workout Categories',
                                  sub: 'See All',
                                  fn: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              FitnessTrainerScreen(
                                                  trainers: trainers ?? []),
                                        ));
                                  }),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => InkWell(
                                          overlayColor:
                                              MaterialStateProperty.all(
                                                  Colors.transparent),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailTrainerScreen(
                                                          trainer:
                                                              trainers[index]),
                                                ));
                                          },
                                          child: CardNewWorkout(
                                            title: trainers[index].name,
                                            sub: trainers[0].specializeIn!,
                                            thumbnail:
                                                trainers[index].background,
                                            fn: (String value) {},
                                          ),
                                        ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          width: 10,
                                        ),
                                    itemCount: trainers.length),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ),
      ),
    ));
  }
}
