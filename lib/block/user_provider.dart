import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/block/models/client_model.dart';
import 'package:project_app/common_widget/dialog_widget.dart';
import 'package:project_app/screens/home_screen.dart';
import 'package:project_app/util/show_diaglog.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserProvide with ChangeNotifier{
  late int _active = 0;
  get active => _active;
  voidSetActive(bool act){
    _active =  act ? 0 : 1;
    notifyListeners();
  }
  //   SHARED PREFERENCES
  String toJson(Map<String,dynamic> user){
    return jsonEncode(user);
  }
  Map<String ,dynamic> toMap(String user){
    return jsonDecode(user);
  }
  Future<void> setData(String key, Map<String,dynamic> user) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, toJson(user));
  }
  Future<Map<String,dynamic>> getUserInfo(String key) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String user =  sharedPreferences.getString(key) ?? '';
    return toMap(user);
  }

  // USER AUTHENTICATION
  Map<String,dynamic> infoUser = {
    "age":18,
    "gender":"name",
    "level":'medium',
    "weight":65,
    "height":175,
    "goal":"gain weight",
  };
  setInfoUser( String type, dynamic value){
    infoUser[type] = value;
  }

  // ignore: non_constant_identifier_names
  Future<void> register(String email , String password,BuildContext context) async{
    try{
      FirebaseAuth auth  = FirebaseAuth.instance;
      FirebaseFirestore fireBase = FirebaseFirestore.instance;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      // await userCredential.user!.updateDisplayName(username);
      infoUser['email'] = email;
      await fireBase.collection("users").doc(userCredential.user!.uid).set(infoUser);
      // ignore: use_build_context_synchronously
      return ShowDialog('Success', 'register successfully', context);
    } on FirebaseAuthException catch (e){
        if(e.code == 'email-already-in-use'){
          // ignore: use_build_context_synchronously
          return ShowDialog('Error', 'account has existed', context);
        }
    } catch (e){
      // ignore: use_build_context_synchronously
      return ShowDialog('Error', e.toString(), context);
    }

  }
  Future<void> login(String email,String password,BuildContext context) async{
    try{
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore authStore = FirebaseFirestore.instance;
      UserCredential user = await auth.signInWithEmailAndPassword(email: email, password: password);
      DocumentReference<Map<String,dynamic>> userSnapshot =   authStore.collection('users').doc(user.user!.uid);
      DocumentSnapshot<Map<String,dynamic>> data = await userSnapshot.get();
      await setData('userInfo', data.data()!);
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
    } on FirebaseAuthException catch(e){
        if(e.code == 'user-not-found'){
          // ignore: use_build_context_synchronously
          return ShowDialog('Error', 'account not existed! please login before!', context);
        }
        if(e.code == 'wrong-password'){
          // ignore: use_build_context_synchronously
          return ShowDialog('Error', 'password went wrong', context);
        }
    }
  }

}