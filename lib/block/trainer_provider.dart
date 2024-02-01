import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:project_app/block/models/trainer_model.dart';

Map<String, dynamic> trainerDetail = {
  "id": "1234567",
  "age": 20,
  "email": "Nicola@gmail.com",
  "address": "don't know",
  "name": "Jennifer James",
  "specializedIn": "Functional Strength",
  "experiences": 5.3,
  "evaluate": 4.8,
  "avatar":
      "https://res.cloudinary.com/dwu92ycra/image/upload/v1701006760/Gym-app/Image_23_gmcink.png",
  "completed": 50,
  "activeClients": 25,
  "background":
      "https://res.cloudinary.com/dwu92ycra/image/upload/v1701006760/Gym-app/Image_23_gmcink.png"
};

class TrainerProvider with ChangeNotifier {
  Future<TrainerModel> getDetail(String id) async {
    TrainerModel data = TrainerModel.fromJson(trainerDetail);
    return data;
  }

  Future<TrainerModel> getTrainerById(String id) async {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> trainerRef =
        fireStore.collection('trainer');
    DocumentSnapshot<Map<String, dynamic>> trainerSnapshot =
        await trainerRef.doc(id).get();
    return TrainerModel.fromJson(trainerSnapshot.data()!);
  }

  Future<void> addTrainer(List<Map<String, dynamic>> trainers) async {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    try {
      for (var trainer in trainers) {
        CollectionReference<Map<String, dynamic>> trainerRef =
            fireStore.collection('trainer');
        DocumentReference newTrainer = await trainerRef.add(trainer['trainer']);
      }
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<List<TrainerModel>> getAllTrainer() async {
    List<TrainerModel> trainers = [];
    try {
      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      CollectionReference<Map<String, dynamic>> trainerRef =
          fireStore.collection('trainer');
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await trainerRef.get();
      for (var trainer in querySnapshot.docs) {
        Map<String, dynamic> fullTrainer = trainer.data();
        fullTrainer['id'] = trainer.id;
        trainers.add(TrainerModel.fromJson(fullTrainer));
      }
      return trainers;
    } catch (e) {
      throw Exception(e);
    }
  }
}
