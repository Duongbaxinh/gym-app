import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_app/my_app.dart';
import 'package:project_app/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_app/block/appointment_provider.dart';
import 'package:project_app/block/lesson_provider.dart';
import 'package:project_app/block/review_provider.dart';
import 'package:project_app/block/schedule_provider.dart';
import 'package:project_app/block/trainer_provider.dart';
import 'package:project_app/block/user_provider.dart';
import 'package:project_app/block/workout_plan_provider.dart';
import 'package:project_app/firebase_options.dart';
import 'package:project_app/screens/screen_auth/auth_screen.dart';
import 'package:project_app/screens/screen_option.dart';
import 'package:project_app/screens/start_screen.dart';
import 'package:project_app/screens/video_screen.dart';
import 'package:project_app/screens/workout_category_screen.dart';
import 'package:project_app/theme/custom_theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      ChangeNotifierProvider<ReviewProvider>(
        create: (context) => ReviewProvider(),
      ),
      ChangeNotifierProvider<ScheduleProvider>(
        create: (context) => ScheduleProvider(),
      ),
      ChangeNotifierProvider<AppointmentProvider>(
        create: (context) => AppointmentProvider(),
      )
    ],
    child: const SplashScreen(),
  ));
}
