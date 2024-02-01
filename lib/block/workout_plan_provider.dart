import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_app/block/models/lesson.dart';
import 'package:project_app/block/models/trainer_model.dart';
import 'package:project_app/constant/list_data_start.dart';
import 'models/work_plan_model.dart';

class WorkOutPlanProvider with ChangeNotifier {
  WorkPlanModel workPlanModel = WorkPlanModel();
  late String _currentCategory = 'Beginner';
  late bool _isLoading = false;
  late List<WorkPlanModel> _workPlanCategories = [];
  List<WorkPlanModel> get workPlanCategories => _workPlanCategories;
  get currentCategory => _currentCategory;
  get isLoading => _isLoading;
  int run = 0;
  Future<void> init() async {
    _isLoading = true;
    _workPlanCategories =
        await getWorkoutByCategory(_currentCategory.toLowerCase());
    _isLoading = false;
  }

  void listLesson(String value) async {
    if (_currentCategory != value) {
      _currentCategory = value;
      notifyListeners();
    }
  }

  // ADD WORK PLAN
  Future<void> addWorkoutPlan() async {
    for (var workout in dataWorkout) {
      await addOneWorkPlan(workout);
    }
  }

  Future<void> addOneWorkPlan(Map<String, dynamic> dataWorkout3) async {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    CollectionReference workPlanRef = fireStore.collection('workPlan');
    DocumentReference newWorkout =
        await workPlanRef.add(dataWorkout[0]['workout']);
    for (var lesson in dataWorkout[0]['lessons']) {
      await fireStore
          .collection('workPlan')
          .doc(newWorkout.id)
          .collection('lessons')
          .doc()
          .set(lesson);
    }
    await fireStore
        .collection('workPlan')
        .doc(newWorkout.id)
        .collection('trainer')
        .doc()
        .set(dataWorkout[0]['trainer']);
  }

  // GET WORK PLAN
  Future<TrainerModel> getTrainerByIdWorkPlan(String idWorkPlan) async {
    try {
      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      CollectionReference<Map<String, dynamic>> trainerRef = fireStore
          .collection('workPlan')
          .doc(idWorkPlan)
          .collection('trainer');
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await trainerRef.get();
      return TrainerModel.fromJson(querySnapshot.docs.first.data()!);
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<List<LessonModel>> getLessonByWorkPlan(String id) async {
    try {
      List<LessonModel> lessons = [];
      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      CollectionReference<Map<String, dynamic>> lessonRef =
          fireStore.collection('workPlan').doc(id).collection('lessons');
      QuerySnapshot<Map<String, dynamic>> lessonSnapshot =
          await lessonRef.get();
      for (var lesson in lessonSnapshot.docs) {
        lessons.add(LessonModel.fromJson(lesson.data()!));
      }
      return lessons;
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<List<WorkPlanModel>> getAllWorkOut() async {
    List<WorkPlanModel> listWorkPlanModel = [];
    try {
      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      CollectionReference<Map<String, dynamic>> workOutPlan =
          fireStore.collection('workPlan');
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await workOutPlan.get();
      for (var workoutPlan in querySnapshot.docs) {
        WorkPlanModel workPlanModel2 =
            WorkPlanModel.fromJson(workoutPlan.data()!);
        List<LessonModel> lessons = await getLessonByWorkPlan(workoutPlan.id);
        workPlanModel2.lessons = lessons;
        listWorkPlanModel.add(workPlanModel2);
      }
      return listWorkPlanModel;
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<List<WorkPlanModel>> getWorkoutByCategory(String category) async {
    List<WorkPlanModel> workouts = [];
    try {
      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      CollectionReference<Map<String, dynamic>> workOutPlan =
          fireStore.collection('workPlan');
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await workOutPlan.where('category', isEqualTo: category).get();
      for (var dataSnapshot in querySnapshot.docs) {
        WorkPlanModel workPlanModel2 =
            WorkPlanModel.fromJson(dataSnapshot.data()!);
        List<LessonModel> lessons = await getLessonByWorkPlan(dataSnapshot.id);
        workPlanModel2.lessons = lessons;
        workouts.add(workPlanModel2);
      }
      return workouts;
    } catch (err) {
      throw Exception(err);
    }
  }
}
