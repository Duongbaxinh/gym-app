import 'package:flutter/material.dart';
import 'package:project_app/theme/custome_theme.dart';

import '../../theme/custom_theme.dart';

class UnitSettingScreen extends StatefulWidget {
  const UnitSettingScreen({super.key});

  @override
  State<UnitSettingScreen> createState() => _UnitSettingScreenState();
}

class _UnitSettingScreenState extends State<UnitSettingScreen> {
  String? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Units of Measure'.toUpperCase(),
          style: CustomText.text5,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            RadioListTile(
              value: "metric",
              groupValue: gender,
              activeColor: Color(0xFFD0FD3E),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
              title: Text(
                "Metric",
                style: CustomText.text3,
              ),
            ),
            RadioListTile(
              value: "imperial",
              groupValue: gender,
              activeColor: Color(0xFFD0FD3E),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
              title: Text(
                "Imperial",
                style: CustomText.text3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
