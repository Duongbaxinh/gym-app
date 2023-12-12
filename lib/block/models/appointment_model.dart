
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_app/block/models/trainer_model.dart';
import 'package:project_app/block/models/user_model.dart';

class AppointmentModel {
  late String idClient;
  late String idTrainer;
  late String time;
  late String date;
  // late String state;
  // late String formOfMeeting;
  // late String location;
  AppointmentModel(this.idClient,this.idTrainer,
      this.time,this.date,
      // this.state,
      // this.formOfMeeting,
      // this.location
      );
  factory AppointmentModel.fromJson(Map<String,dynamic> user){
    return AppointmentModel(
        user['idClient'],
        user['idTrainer'],
        user['time'],
        user['date']
        ) ;
  }

}
