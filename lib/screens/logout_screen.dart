import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/block/user_provider.dart';
import 'package:project_app/screens/screen_auth/auth_screen.dart';
import 'package:provider/provider.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LogoutScreenState();
  }
}

class _LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvide>(context);
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: () async {
          await userProvider.remData('userInfo');
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AuthScreen(),
              ));
        },
        child: Text('Logout'),
      ),
    ));
  }
}
