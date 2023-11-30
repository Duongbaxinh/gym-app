import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:project_app/block/lesson_provider.dart';
import 'package:project_app/common_widget/card_lesson.dart';
import 'package:project_app/common_widget/categories_lesson.dart';
import 'package:project_app/common_widget/custome_listTitle.dart';
import 'package:project_app/common_widget/group_button.dart';
import 'package:project_app/common_widget/new_workcount_card.dart';
import 'package:provider/provider.dart';
Map<String,dynamic> user = {
  "name":"Sara",
  "avatar":"",
};
Map<String,dynamic> lession = {
  "title":"Day 01 Warm Up",
  "time":" 7:00 - 8:00",
  "thumbnail":"https://res.cloudinary.com/dwu92ycra/image/upload/v1700754573/Gym-app/Image_8_anwrvg.png",
  "video":"",
  "trainer":{
    "id":"",
    "name":"",
    "experiences":"",
  }
};
class HomePage extends StatelessWidget{
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Color yelSchema = Theme.of(context).colorScheme.onSecondary;
    TextStyle? titleStyle = Theme.of(context).textTheme.headline1;
    TextStyle subStyle = Theme.of(context).textTheme.headline3!.copyWith(color: yelSchema);
  return  Scaffold(
    body: SafeArea(
      child: Consumer<LessonProvider>(
        builder: (context, lessonProvider, child) =>
         SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                    title: Text('Hello ${user['name']}'.toUpperCase(),style: titleStyle,),
                  subtitle: Text('Good morning',style: subStyle,),
                ),
                Column(
                  children: [
                   CustomListTitle(title: 'Today work plan', sub: 'Mon 26 Apr', fn: (value){}),
                    CardLesson(titleLesson: lession['title'],
                        subLesson: lession['time'],
                        thumbnail: lession['thumbnail'])
                  ],
                ),
                Column(
                  children: [
                    CustomListTitle(title: 'Workout Categories', sub: 'See All', fn: (value){}),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      height: 50,
                      child: GroupButtonCustom(
                          fn: (value){lessonProvider.listLesson('advance');},
                          listButton: ['Beginner','Intermediate','Advance']),
                    ),
                    SizedBox(
                      height: 180,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              CardLesson(titleLesson: lession['title'],
                                  subLesson: lession['time'],
                                  thumbnail: lession['thumbnail']),
                          separatorBuilder: (context, index) => SizedBox(width: 10,),
                          itemCount: 3),
                    )
                  ],
                ),
                Column(
                  children: [
                    CustomListTitle(title: 'New workout', sub: '', fn: (value){}),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => CardNewWorkout(
                              title: 'New lesson 1',
                              sub: 'sub new lesson 1',
                              thumbnail: 'https://res.cloudinary.com/dwu92ycra/image/upload/v1700885162/Gym-app/Image_10_nnhp3u.png',
                              fn: (value){}),
                          separatorBuilder: (context, index) => SizedBox(width: 10,),
                          itemCount: 3),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    )
  );
  }
  
}