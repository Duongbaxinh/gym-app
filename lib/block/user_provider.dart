import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_app/screens/screen_option.dart';
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
  };
  setInfoUser( String type, dynamic value){
    infoUser[type] = value;
  }

  // ignore: non_constant_identifier_names
  Future<void> register(BuildContext context) async{
    try{
      FirebaseAuth auth  = FirebaseAuth.instance;
      FirebaseFirestore fireBase = FirebaseFirestore.instance;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: infoUser['email'], password: infoUser['password']);
      // await userCredential.user!.updateDisplayName(username);
      infoUser['premium'] = false;
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
      DocumentReference<Map<String,dynamic>> userSnapshot =  authStore.collection('users').doc(user.user!.uid);
      DocumentSnapshot<Map<String,dynamic>> data = await userSnapshot.get();
      print('chec---------------1k ${data.data()!}');
      Map<String,dynamic> userFull = data.data()!;
      userFull['id'] = user.user!.uid;
      await setData('userInfo', userFull!);
      Map<String,dynamic> ooo = await getUserInfo('userInfo');
      print('checkkkkkkkkkkkk $ooo');
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenOption(),));
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