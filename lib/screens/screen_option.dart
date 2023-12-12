import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/screens/home_screen.dart';
import 'package:project_app/screens/screen_auth/auth_screen.dart';
import 'package:project_app/screens/screen_infor/gender_screen.dart';
import 'package:project_app/screens/screen_infor/height_screen.dart';
import 'package:project_app/screens/screen_infor/weight_screen.dart';

class ScreenOption extends StatefulWidget {
  const ScreenOption({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ScreenOptionState();
  }
}

class _ScreenOptionState extends State<ScreenOption> {
  int _indexSelected = 0;
  void setSelected(int index) {
    setState(() {
      _indexSelected = index;
    });
  }
  List<Widget> listScreenWidget = [
    const HomePage(),
    const Gender(),
    const Weight(),
    const HeightScreen()
  ];
  String homeImage = 'https://res.cloudinary.com/dwu92ycra/image/upload/v1700837324/Gym-app/Home_ldn5km.png';
  String insightImage = 'https://res.cloudinary.com/dwu92ycra/image/upload/v1700837247/Gym-app/Insight_d2cbax.png';
  String notificationImage = 'https://res.cloudinary.com/dwu92ycra/image/upload/v1700837262/Gym-app/Notification_jykqag.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listScreenWidget[_indexSelected],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexSelected,
        onTap: (index) => setSelected(index),
        selectedItemColor: Colors.white,
        unselectedItemColor: Theme.of(context).colorScheme.onSecondaryContainer,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(NetworkImage(homeImage)),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(NetworkImage(insightImage)),
            label: 'Insight'
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(NetworkImage(notificationImage)),
            label: 'Notification'
          ),
          const BottomNavigationBarItem(
              icon: CircleAvatar(backgroundImage: NetworkImage('https://res.cloudinary.com/dwu92ycra/image/upload/v1701570978/Gym-app/hinh-anh-avatar-Luffy_uovait.jpg')),
              label: 'Notification'
          ),
        ],
      ),
    );
  }
}
