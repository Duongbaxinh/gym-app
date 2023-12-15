import 'package:flutter/material.dart';
import 'package:project_app/util/show_diaglog.dart';
import 'package:project_app/widgetGroup/workout_category.dart';

Future<void> showRecommendation(
    BuildContext context
    ) async {
    return showDialog(context: context,
        builder: (context) =>  AlertDialog(
            alignment: Alignment.bottomCenter,
          content: Container(
            height: 180,
              width: 200,
              color: Colors.red,
          ),
        ),
    );
}