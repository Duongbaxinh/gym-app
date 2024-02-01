import 'package:flutter/material.dart';
import 'package:project_app/screens/setting/unit_setting_screen.dart';

import '../../theme/custom_theme.dart';
import 'language_setting.dart';
import 'notification_setting_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: SafeArea(
          child: Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'Settings'.toUpperCase(),
                      style: CustomText.text5,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Route route = MaterialPageRoute(
                    builder: (context) => const UnitSettingScreen());
                Navigator.push(context, route);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                    border: Border(
                  top: BorderSide(color: Colors.grey),
                  bottom: BorderSide(color: Colors.grey),
                )),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Units of Measure',
                      style: CustomText.text3,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Route route = MaterialPageRoute(
                    builder: (context) => const NotificationSettingScreen());
                Navigator.push(context, route);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Colors.grey),
                )),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notifications',
                      style: CustomText.text3,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Route route =
                    MaterialPageRoute(builder: (context) => const LanguageSetting());
                Navigator.push(context, route);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Colors.grey),
                )),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Language',
                      style: CustomText.text3,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.grey),
              )),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Contact Us',
                    style: CustomText.text3,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
