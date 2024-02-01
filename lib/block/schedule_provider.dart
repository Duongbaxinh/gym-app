import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_app/block/models/schedule_model.dart';

class ScheduleProvider with ChangeNotifier {
  Future<void> addSchedule(List<Map<String, dynamic>> schedules) async {
    // khởi tạo instance firebase
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    // lấy collection schedule từ firebase
    CollectionReference scheduleRef = fireStore.collection('schedule');
    // thêm schedule vào collection schedule
    for (var schedule in schedules) {
      await scheduleRef.add(schedule);
    }
    print('Added successfully');
  }

  Future<ScheduleModel> getScheduleForTrainer(String idTrainer) async {
    // khởi to
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    try {
      CollectionReference<Map<String, dynamic>> scheduleRef =
          fireStore.collection('schedule');
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await scheduleRef.where("idTrainer", isEqualTo: idTrainer).get();
      Map<String, dynamic> data = querySnapshot.docs.first.data()!;
      ScheduleModel sch = ScheduleModel.fromJson(data);
      return sch;
    } catch (err) {
      throw Exception(err);
    }
  }
}
