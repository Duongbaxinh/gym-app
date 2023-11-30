import 'package:flutter/foundation.dart';
import 'package:project_app/block/models/trainer_model.dart';
Map<String, dynamic> trainerDetail = {
  "id":"1234567",
  "age":20,
  "email":"Nicola@gmail.com",
  "address":"don't know",
  "name":"Jennifer James",
  "specializedIn":"Functional Strength",
  "experiences":5.3,
  "evaluate":4.8,
  "avatar":"https://res.cloudinary.com/dwu92ycra/image/upload/v1701006760/Gym-app/Image_23_gmcink.png",
  "completed":50,
  "activeClients":25,
  "background":"https://res.cloudinary.com/dwu92ycra/image/upload/v1701006760/Gym-app/Image_23_gmcink.png"
};
class TrainerProvider with ChangeNotifier{
  Future<TrainerModel> getDetail(String id) async {
    TrainerModel data =  TrainerModel.fromJson(trainerDetail);
    return data;
  }
}