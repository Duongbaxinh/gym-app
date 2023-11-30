import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/screens/screen_auth/login_screen.dart';
import 'package:project_app/screens/screen_auth/register_screen.dart';

class AuthScreen extends StatelessWidget{
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return   Scaffold(
     body: DefaultTabController(
       length: 2,
       initialIndex: 0,
       child: Stack(
         fit: StackFit.loose,
         children: [
           const TabBarView(
           children: [
             Login(),
             Register(),
           ]),
           Positioned(
             top:60,
               left: 0,
               child: SizedBox(
             width: 200,
                  child: TabBar(
                  labelColor: Theme.of(context).colorScheme.onSecondary,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
               tabs: const [
                   Tab(text: 'Login',),
                   Tab(text: 'Register',),
               ],
             ),
           )
           ),

         ],
       ),
     ),
   );
  }

}