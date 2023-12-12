import 'dart:math';

import 'package:project_app/block/abstract/conver_data.dart';
import 'package:project_app/block/models/client_model.dart';
import 'package:project_app/block/models/user_model.dart';

class TrainerModel extends UserModel{
  late String? id;
  late double? experiences;
  late int? completed;
  late int? activeClients;
  late double? evaluate;
  late String? specializeIn;
  TrainerModel (
      super.name,
      super.age,
      super.email,
      super.address,
      super.avatar,
      super.background,
      this.id,
      this.specializeIn,
      this.experiences,
      this.completed,
      this.activeClients,
      this.evaluate
      );
  factory TrainerModel.fromJson(Map<String, dynamic> data) {
    try{
      return TrainerModel(
          data['name'],
          data['age'],
          data['email'],
          data['address'],
          data['avatar'],
          data['background'],
          data['id'],
          data['specializeIn'],
          data['experiences'],
          data['completed'],
          data['activeClients'],
          data['evaluate'],
      );
    }
    catch (e){
      throw Exception(e);
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

  @override
  String toString() {
    return 'TrainerModel{id: $id, experiences: $experiences, completed: $completed, activeClients: $activeClients, evaluate: $evaluate, specializeIn: $specializeIn}';
  }
}