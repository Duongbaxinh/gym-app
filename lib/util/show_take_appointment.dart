import 'package:flutter/material.dart';
import 'package:project_app/common_widget/appointment_diaglog.dart';
import 'package:project_app/common_widget/button_widget.dart';
import 'package:project_app/common_widget/card_lesson.dart';
import 'package:project_app/util/show_diaglog.dart';

Future<void> ShowAppointment(
    String thumbnail,
    String title,String
    sub,  VoidCallback fn,
    BuildContext context)async{
  return showDialog<void>(
      context: context,
      builder: (context) =>
          AppointmentDialog(
            titleButton: 'Take Appointment',
              title: title, sub: sub,
              thumbnail: thumbnail,
              fn: fn)
  );
}