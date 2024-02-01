import 'package:flutter/material.dart';
import 'package:project_app/screens/screen_option.dart';
import 'package:project_app/screens/start_screen.dart';
import 'package:project_app/theme/custom_theme.dart';
import 'package:provider/provider.dart';

import 'block/trainer_provider.dart';
import 'block/user_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvide>(context);
    final trainerProvider = Provider.of<TrainerProvider>(context);
    Future<Map<String, dynamic>> userInfo() async {
      // await trainerProvider.addTrainer(dataWorkout);
      return await userProvider.getUserInfo('userInfo');
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeDataClass.darkTheme,
      darkTheme: ThemeDataClass.darkTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 28, 28, 30),
          body: FutureBuilder(
              future: userInfo(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const ScreenOption();
                } else {
                  return const StartPage();
                }
              })),
    );
  }
}
