import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:project_app/block/models/lesson_model.dart';

class LessonProvider with ChangeNotifier{
   Future<void> listLesson(String level) async{
     FirebaseFirestore firestore =  FirebaseFirestore.instance;
      // List<LessonModel> lessons = [];
      CollectionReference<Map<String,dynamic>> dataLesson =  firestore.collection('users');
      QuerySnapshot lesson = await dataLesson.get();
      for(var data in lesson.docs){
        print('check data user all :::::: ${data.data()}');
      }
      // return lessons;
   }
}