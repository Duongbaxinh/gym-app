import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/common_widget/button_widget.dart';
import 'package:project_app/common_widget/custome_icon_button.dart';
import 'package:project_app/common_widget/ouline_button_custom.dart';
import 'package:project_app/common_widget/trainer_card.dart';
import 'package:project_app/constant/index.dart';
import 'package:table_calendar/table_calendar.dart';
class AppointmentScreen extends StatelessWidget{
  final String trainerName;
  final String specializeIn;
  final String experience;
  final String evaluate;
  final String avatar;
  final VoidCallback fn;
  const AppointmentScreen(
  {super.key,
    required this.trainerName,
    required this.specializeIn,
    required this.experience,
    required this.evaluate,
    required this.avatar,
    required this.fn}
      );

  @override
  Widget build(BuildContext context){
    Color yelSchema = Theme.of(context).colorScheme.onSecondary;
    TextStyle subTitle = Theme.of(context).textTheme.headline4!;
    TextStyle titleStyle = Theme.of(context).textTheme.headline3!;
    return  Scaffold(
        appBar: AppBar(
          title: Text('Appointment'.toUpperCase(),style: titleStyle,),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: CustomeIconButton(imageIcon: arrowLeft,fn:(){Navigator.pop(context);},),
          ),
          elevation: 0,
        ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 15),
        child: ButtonCustom(
          title: 'next',
          icon: false,
          fn:(){}
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: TrainerCard(
                  trainerName: trainerName,
                  specializeIn: specializeIn,
                  experience: experience,
                  evaluate: evaluate,
                  avatar: avatar,
                  fn: fn),
            ),
            Container(
              margin:  const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(15))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TableCalendar(
                      onDaySelected: (selectedDay, focusedDay) => print('$selectedDay ---- $focusedDay'),
                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                        ),
                        focusedDay: DateTime.now(),
                        rowHeight: 35,
                        selectedDayPredicate: (day) => isSameDay(day, DateTime.now()),
                        firstDay: DateTime.utc(2023, 11,01),
                        lastDay: DateTime.utc(2024, 11,01)),
                    const Divider(color: Colors.white, thickness: 0.5,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text('Time',style: titleStyle,),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => SizedBox(width: 15,),
                        itemBuilder: (context, index) =>   OutlinebuttonCustom(title: '9:30 AM', fn: (value){}),
                        itemCount: 3,

                      ),
                    )
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