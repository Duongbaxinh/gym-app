import 'package:project_app/block/models/lesson.dart';

class WorkPlanModel {
  WorkPlanModel();
  late final String thumbnail;
  late final String timeDetail;
  late final int totalTime;
  late final String background;
  late final String namePlan;
  late final String description;
  late final int totalCalo;
  late final String state;
  late final String describe;
  late final String category;
  late List<LessonModel> lessons;

  WorkPlanModel.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    timeDetail = json['timeDetail'];
    totalTime = json['totalTime'];
    background = json['background'];
    namePlan = json['namePlan'];
    description = json['description'];
    totalCalo = json['totalCalo'];
    state = json['state'];
    describe = json['describe'];
    category = json['category'];
    lessons = json['lessons'] ?? [];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['thumbnail'] = thumbnail;
    _data['timeDetail'] = timeDetail;
    _data['totalTime'] = totalTime;
    _data['background'] = background;
    _data['namePlan'] = namePlan;
    _data['description'] = description;
    _data['totalCalo'] = totalCalo;
    _data['state'] = state;
    _data['describe'] = describe;
    _data['category'] = category;
    _data['lessons'] = lessons ?? [];
    return _data;
  }

  @override
  String toString() {
    return 'WorkPlanModel{thumbnail: $thumbnail, timeDetail: $timeDetail, totalTime: $totalTime, background: $background, namePlan: $namePlan, description: $description, totalCalo: $totalCalo, state: $state, describe: $describe, category: $category, lessons: $lessons}';
  }
}
