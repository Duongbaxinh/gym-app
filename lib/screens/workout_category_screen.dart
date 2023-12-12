
import 'package:flutter/material.dart';
import 'package:project_app/widgetGroup/workout_category.dart';

class WorkoutCategoriesScreen extends StatelessWidget{
  const WorkoutCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context){
    TextStyle header = Theme.of(context).textTheme.headline2!;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Categories Workout',style:header,),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child:
        SingleChildScrollView(child:
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: WorkOutCategory(scrollDirection: Axis.vertical,),
        )
        )
      ),
    );
  }
}