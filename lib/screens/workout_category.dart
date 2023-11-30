import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/common_widget/group_button.dart';
import 'package:project_app/constant/list_data_start.dart';

import '../common_widget/card_lesson.dart';

class WorkoutCategories extends StatelessWidget{
  const WorkoutCategories({super.key});

  @override
  Widget build(BuildContext context){
    TextStyle header = Theme.of(context).textTheme.headline2!;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Catagories Workout',style:header,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 25),
               height: 50,
              child: GroupButtonCustom(fn: (value){}, listButton: ['Beginner','Intermediate','Advance']),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height -220,
              child: ListView.separated(
                shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      CardLesson(titleLesson: lessons[index]!['title'],
                          subLesson: lessons![index]!['time'],
                          thumbnail: lessons![index]!['thumbnail']),
                  separatorBuilder: (context, index) => SizedBox(height: 20,),
                  itemCount: 5),
            )

          ],
        ),
      ),
    );
  }
}