
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_app/block/models/client_model.dart';
import 'package:project_app/block/models/trainer_model.dart';
import 'package:project_app/block/models/user_model.dart';
import 'package:project_app/block/models/work_plan_model.dart';

class ScheduleModel {
  late String? idTrainer;
  late List<dynamic>? schedulesTime;
  ScheduleModel(
      this.idTrainer,
      this.schedulesTime,
      );
  factory ScheduleModel.fromJson(Map<String,dynamic> schedule){
    print('------------------ ${schedule['schedulesTime']}');
    return ScheduleModel(
      schedule['idTrainer'],
      schedule['schedulesTime'],
    ) ;
  }

}
