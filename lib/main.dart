import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_app/block/lesson_provider.dart';
import 'package:project_app/block/trainer_provider.dart';
import 'package:project_app/block/user_provider.dart';
import 'package:project_app/common_widget/card_review.dart';
import 'package:project_app/common_widget/custom_chip.dart';
import 'package:project_app/common_widget/rate_custom.dart';
import 'package:project_app/common_widget/trainer_card.dart';
import 'package:project_app/constant/list_data_start.dart';
import 'package:project_app/screens/detai_trainer_screen.dart';
import 'package:project_app/screens/fitness_trainers_screen.dart';
import 'package:project_app/screens/home_screen.dart';
import 'package:project_app/screens/ratting_screen.dart';
import 'package:project_app/screens/screen_auth/auth_screen.dart';
import 'package:project_app/screens/screen_auth/login_screen.dart';
import 'package:project_app/screens/screen_infor/age_screen.dart';
import 'package:project_app/screens/detai_lesson_screen.dart';
import 'package:project_app/screens/screen_infor/gender_screen.dart';
import 'package:project_app/screens/screen_infor/goal_screen.dart';
import 'package:project_app/screens/screen_infor/height_screen.dart';
import 'package:project_app/screens/screen_infor/level_screen.dart';
import 'package:project_app/screens/screen_infor/weight_screen.dart';
import 'package:project_app/screens/screen_option.dart';
import 'package:project_app/screens/start_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:project_app/screens/submit_screen.dart';
import 'package:project_app/screens/workout_category.dart';
import 'package:project_app/theme/custome_theme.dart';
import 'package:project_app/theme/provider_theme.dart';
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
      home:  Scaffold(
        backgroundColor: Color.fromARGB(255, 28, 28, 30),
          body: RattingScreen(),
          // DetailTrainerScreen()
          // Container(
          //   margin: EdgeInsets.only(top: 200),
          //   child: Column(
          //     children: [
          //       SizedBox(
          //         height: 10,
          //         child: Row(
          //           mainAxisSize: MainAxisSize.max,
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text('lable'),
          //             Expanded(
          //               child: SliderTheme(
          //                 child: Slider(
          //                   value: 0.2,
          //                   max: 0.5,
          //                   label: '5',
          //                   activeColor: Colors.red,
          //                   onChanged: (value){},
          //                 ),
          //                 data: SliderTheme.of(context).copyWith(
          //                   trackHeight: 2,
          //                   thumbShape: SliderComponentShape.noThumb,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       SizedBox(
          //         height: 10,
          //         child: Row(
          //           mainAxisSize: MainAxisSize.max,
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text('lable'),
          //             Expanded(
          //               child: SliderTheme(
          //                 child: Slider(
          //                   value: 0.4,
          //                   max: 0.5,
          //                   label: '5',
          //                   activeColor: Colors.red,
          //                   onChanged: (value){},
          //                 ),
          //                 data: SliderTheme.of(context).copyWith(
          //                   trackHeight: 2,
          //                   thumbShape: SliderComponentShape.noThumb,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       SizedBox(
          //         height: 10,
          //         child: Row(
          //           mainAxisSize: MainAxisSize.max,
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text('lable'),
          //             Expanded(
          //               child: SliderTheme(
          //                 child: Slider(
          //                   value: 0.4,
          //                   max: 0.5,
          //                   label: '5',
          //                   activeColor: Colors.red,
          //                   onChanged: (value){},
          //                 ),
          //                 data: SliderTheme.of(context).copyWith(
          //                   trackHeight: 2,
          //                   thumbShape: SliderComponentShape.noThumb,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       SizedBox(
          //         height: 10,
          //         child: Row(
          //           mainAxisSize: MainAxisSize.max,
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text('lable'),
          //             Expanded(
          //               child: SliderTheme(
          //                 child: Slider(
          //                   value: 0.4,
          //                   max: 0.5,
          //                   label: '5',
          //                   activeColor: Colors.red,
          //                   onChanged: (value){},
          //                 ),
          //                 data: SliderTheme.of(context).copyWith(
          //                   trackHeight: 2,
          //                   thumbShape: SliderComponentShape.noThumb,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       SizedBox(
          //         height: 10,
          //         child: Row(
          //           mainAxisSize: MainAxisSize.max,
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text('lable'),
          //             Expanded(
          //               child: SliderTheme(
          //                 child: Slider(
          //                   value: 0.4,
          //                   max: 0.5,
          //                   label: '5',
          //                   activeColor: Colors.red,
          //                   onChanged: (value){},
          //                 ),
          //                 data: SliderTheme.of(context).copyWith(
          //                   trackHeight: 2,
          //                   thumbShape: SliderComponentShape.noThumb,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //
          //     ],
          //   ),
          // ),
      ),
    );
  }
}


