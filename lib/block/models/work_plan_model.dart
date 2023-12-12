import 'package:project_app/block/models/lesson.dart';
import 'package:project_app/block/models/trainer_model.dart';

class WorkPlanModel {
  late String? id;
  late String namePlan;
  late String thumbnail;
  late String background;
  late String describe;
  late String description;
  late String category;
  late double totalTime;
  late String timeDetail;
  late double totalCalo;
  late String state;
  late List<LessonModel>? lessons;
  late TrainerModel ? trainer;
  WorkPlanModel();
  factory WorkPlanModel.fromJson(Map<String , dynamic> lesson){
  try{
    WorkPlanModel workPlanModel = WorkPlanModel();
    workPlanModel.id = lesson['id'];
    workPlanModel.namePlan = lesson['namePlan'];
    workPlanModel.thumbnail = lesson['thumbnail'];
    workPlanModel.background = lesson['background'];
    workPlanModel.describe = lesson['describe'];
    workPlanModel.description = lesson['description'];
    workPlanModel.category = lesson['category'];
    workPlanModel.totalTime =  lesson['totalTime'];
    workPlanModel.timeDetail = lesson['timeDetail'];
    workPlanModel.totalCalo =  lesson['totalCalo'];
    workPlanModel.state = lesson['state'];
    workPlanModel.lessons =  lesson['lessons'];
    workPlanModel.trainer =  lesson['trainer'];
    return workPlanModel;
  }catch (err){
    throw Exception(err);
  }
  }

  @override
  String toString() {
    return 'WorkPlanModel{id: $id, namePlan: $namePlan, thumbnail: $thumbnail, category: $category, totalTime: $totalTime, timeDetail: $timeDetail, totalCalo: $totalCalo, state: $state, lessons: $lessons, trainer: $trainer}';
  }
}