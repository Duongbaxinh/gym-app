import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class AppointmentProvider with ChangeNotifier{
 Map<String,dynamic> appointment = {};
 void setAppointment(String key,dynamic value){
  appointment[key] = value;
  print('check set appointment $appointment');
 }
 Future<void> bookAppointment() async{
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  try{
   CollectionReference<Map<String,dynamic>> appointmentRef = fireStore.collection('appointment');
   DocumentReference<Map<String,dynamic>> documentSnapshot = await appointmentRef.add(appointment);
   print('booked ${appointment} successfully');
  }catch (err){
   throw Exception(err);
  }
 }
}
