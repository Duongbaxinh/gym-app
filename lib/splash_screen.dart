import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_app/screens/screen_option.dart';
import 'package:project_app/screens/start_screen.dart';
import 'package:project_app/theme/custom_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:project_app/my_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  var isLoading = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeDataClass.darkTheme,
        darkTheme: ThemeDataClass.darkTheme,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Color.fromARGB(255, 28, 28, 30),
            body: isLoading
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/images/splash.png'),
                          ),
                          Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ],
                      ),
                    ),
                  )
                : MyApp()));
  }
}
