import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:project_app/block/models/lesson.dart';
import 'package:project_app/block/models/work_plan_model.dart';

class LessonProvider with ChangeNotifier{
  void listLesson(String value){
    print(value);
  }

  Future<LessonModel> getLessonById(String id) async{
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    CollectionReference<Map<String,dynamic>> lessonRef = fireStore.collection('trainer');
    DocumentSnapshot<Map<String,dynamic>> lessonSnapshot =  await lessonRef.doc(id).get();
    return LessonModel.fromJson(lessonSnapshot.data()!);
  }

}