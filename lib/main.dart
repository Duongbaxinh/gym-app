import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_app/block/appointment_provider.dart';
import 'package:project_app/block/lesson_provider.dart';
import 'package:project_app/block/review_provider.dart';
import 'package:project_app/block/schedule_provider.dart';
import 'package:project_app/block/trainer_provider.dart';
import 'package:project_app/block/user_provider.dart';
import 'package:project_app/block/workout_plan_provider.dart';
import 'package:project_app/screens/screen_auth/auth_screen.dart';
import 'package:project_app/screens/screen_option.dart';
import 'package:project_app/theme/custom_theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          // appId: dotenv.env['FB_APP_ID']!,
          // projectId: dotenv.env['FB_PROJECT_ID']!,
          // messagingSenderId: dotenv.env['FB_MESS_ID']!,
          // apiKey: dotenv.env['FB_API_KEY']!)
          appId: '1:578863321924:android:55d849f74aba24d4587d11',
          projectId: 'gym-app-48398',
          messagingSenderId: '578863321924',
          apiKey: 'AIzaSyDdLVRfjmPZBzc0GgKI5Fs3MVx2nNjhHFs'));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserProvide>(
        create: (context) => UserProvide(),
      ),
      ChangeNotifierProvider<LessonProvider>(
        create: (context) => LessonProvider(),
      ),
      ChangeNotifierProvider<TrainerProvider>(
        create: (context) => TrainerProvider(),
      ),
      ChangeNotifierProvider<WorkOutPlanProvider>(
        create: (context) => WorkOutPlanProvider(),
      ),
      ChangeNotifierProvider<ReviewProvider>(create: (context) => ReviewProvider(),),
      ChangeNotifierProvider<ScheduleProvider>(create: (context) => ScheduleProvider(),),
      ChangeNotifierProvider<AppointmentProvider>(create: (context) => AppointmentProvider(),)
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvide>(context);
    final trainerProvider = Provider.of<TrainerProvider>(context);
    Future<Map<String,dynamic>> userInfo() async {
      // await trainerProvider.addTrainer(dataWorkout);
      return await userProvider.getUserInfo('userInfo');
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeDataClass.darkTheme,
      darkTheme: ThemeDataClass.darkTheme,
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
          backgroundColor: Color.fromARGB(255, 28, 28, 30),
          body:
          // VideoScreen(),

          FutureBuilder(
            future: userInfo(),
              builder: (context, snapshot){
              if(snapshot.hasData){
                return const ScreenOption();
              }else{
                return const AuthScreen();
              }              }
              )
          ),
    );
  }
}
