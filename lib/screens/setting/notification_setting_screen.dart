import 'package:flutter/material.dart';
import 'package:project_app/theme/custome_theme.dart';

import '../../theme/custom_theme.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  bool light_wr = true;
  bool light_pn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Notifications'.toUpperCase(),
          style: CustomText.text5,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Workout Reminders',
                      // style: CustomText.text3,
                    ),
                    Switch(
                      // This bool value toggles the switch.
                      value: light_wr,
                      activeColor: const Color(0xFFD0FD3E),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      splashRadius: 0,
                      onChanged: (bool value) {
                        // This is called when the user toggles the switch.
                        setState(() {
                          light_wr = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Program Notifications',
                      // style: CustomText.text3,
                    ),
                    Switch(
                      // This bool value toggles the switch.
                      value: light_pn,
                      activeColor: const Color(0xFFD0FD3E),
                      onChanged: (bool value) {
                        // This is called when the user toggles the switch.
                        setState(() {
                          light_pn = value;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
            Center(
              child: RichText(
                text: const TextSpan(
                  text:
                      'You can manage your app notification permission in your ',
                  // style: CustomText.text3,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Phone Settings',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD0FD3E),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
