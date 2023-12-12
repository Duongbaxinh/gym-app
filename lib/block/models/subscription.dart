
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_app/block/models/client_model.dart';
import 'package:project_app/block/models/trainer_model.dart';
import 'package:project_app/block/models/user_model.dart';
import 'package:project_app/block/models/work_plan_model.dart';

class Subscription {
  late WorkPlanModel idWorkPlan;
  late TrainerModel idTrainer;
  late ClientModel idClient;
  late String state;
  Subscription(
      this.idWorkPlan,
      this.idTrainer,
      this.idClient,
      this.state,
      );
  factory Subscription.fromJson(Map<String,dynamic> user){
    return Subscription(
        user['idWorkPlan'],
        user['idTrainer'],
        user['idClient'],
        user['state'],
    ) ;
  }

}
