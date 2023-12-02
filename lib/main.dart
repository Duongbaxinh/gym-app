
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_app/block/lesson_provider.dart';
import 'package:project_app/block/trainer_provider.dart';
import 'package:project_app/block/user_provider.dart';
import 'package:project_app/screens/appointment_screen.dart';
import 'package:project_app/screens/detai_trainer_screen.dart';
import 'package:project_app/screens/ratting_screen.dart';
import 'package:project_app/screens/write_comment_screen.dart';
import 'package:project_app/theme/custome_theme.dart';
import 'package:provider/provider.dart';
Future<void> main() async{
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
      apiKey: 'AIzaSyDdLVRfjmPZBzc0GgKI5Fs3MVx2nNjhHFs')
  );
  runApp(
   MultiProvider(providers: [
     ChangeNotifierProvider<UserProvide>(create:(context) => UserProvide(), ),
     ChangeNotifierProvider<LessonProvider>(create:(context) => LessonProvider(),),
     ChangeNotifierProvider<TrainerProvider>(create: (context) => TrainerProvider(),)
   ],
     child: const MyApp() ,
   )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeDataClass.darkTheme,
      darkTheme: ThemeDataClass.darkTheme,
      home:   Scaffold(
        backgroundColor: Color.fromARGB(255, 28, 28, 30),
          body: AppointmentScreen(
              trainerName: 'Emily Kevin',
              specializeIn: 'High Intensity Training',
              experience: '2',
              evaluate: '4.9',
              avatar: 'https://res.cloudinary.com/dwu92ycra/image/upload/v1700927161/Gym-app/Image_21_mqhq4n.png',
              fn: (){} ),
      ),
    );
  }
}


