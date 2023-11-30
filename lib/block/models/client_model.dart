
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class ClientModel {
   late String email;
   late String gender;
   late String age;
   late String weight;
   late String height;
   late String goal;
   late String level;
   ClientModel(this.email,this.gender,this.age,this.weight,this.height,this.goal,this.level);

   factory ClientModel.fromJson(Map<String,dynamic> user){
      return ClientModel(
          user['email'],
          user['gender'],
          user['age'],
          user['weight'],
          user['height'],
          user['goal'],
          user['level']) ;
   }

}
