import 'dart:math';

import 'package:project_app/block/abstract/conver_data.dart';
import 'package:project_app/block/models/client_model.dart';
import 'package:project_app/block/models/user_model.dart';

class TrainerModel extends UserModel implements ConvertData<TrainerModel>{
  late String id;
  late double experiences;
  late int completed;
  late int activeClients;
  late double evaluate;
  late String specializedIn;
  TrainerModel(
      super.name,
      super.age,
      super.email,
      super.address,
      super.avatar,
      super.background,
      this.id,
      this.specializedIn,
      this.experiences,
      this.completed,
      this.activeClients,
      this.evaluate
      );
  factory TrainerModel.fromJson(Map<String, dynamic> data) {
    print('data ---------map $data');
    try{
      return TrainerModel(
          data['name'],
          data['age'],
          data['email'],
          data['address'],
          data['avatar'],
          data['background'],
          data['id'],
          data['specializedIn'],
          data['experiences'],
          data['completed'],
          data['activeClients'],
          data['evaluate'],
      );
    }
    catch (e){
      print('err$e');
      return  TrainerModel(
          data['name'],
          data['age'],
          data['email'],
          data['address'],
          data['avatar'],
          data['id'],
          data['specializedIn'],
          data['experiences'],
          data['completed'],
          data['activeClients'],
          data['evaluate'],
          data['background']);
    }

  }

  @override
  Map<String, dynamic> toMap(data) {
    // TODO: implement toMap
    throw UnimplementedError();
  }

  @override
  TrainerModel fromJson(Map<String, dynamic> data) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

}