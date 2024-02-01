import 'package:flutter/material.dart';
import 'package:project_app/block/appointment_provider.dart';
import 'package:project_app/block/models/schedule_model.dart';
import 'package:project_app/block/schedule_provider.dart';
import 'package:project_app/block/user_provider.dart';
import 'package:project_app/common_widget/button_widget.dart';
import 'package:project_app/common_widget/custom_icon_button.dart';
import 'package:project_app/common_widget/ouline_button_custom.dart';
import 'package:project_app/common_widget/trainer_card.dart';
import 'package:project_app/constant/index.dart';
import 'package:project_app/screens/appointment_done.dart';
import 'package:project_app/util/formatDate.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentScreen extends StatefulWidget {
  final String idTrainer;
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
      required this.fn,
      required this.idTrainer});

  @override
  State<StatefulWidget> createState() {
    return _AppointmentScreenState();
  }
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  DateTime initDate = DateTime.now();
  int initTime = 0;
  void setDate(value) {
    setState(() {
      initDate = value;
    });
  }
  void setTime(value) {
    setState(() {
      initTime = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    Color yelSchema = Theme.of(context).colorScheme.onSecondary;
    TextStyle subTitle = Theme.of(context).textTheme.headline4!;
    TextStyle titleStyle = Theme.of(context).textTheme.headline3!;
    final appointmentProvider = Provider.of<AppointmentProvider>(context);
    final userProvider = Provider.of<UserProvide>(context);
    final scheduleProvider = Provider.of<ScheduleProvider>(context);
    return FutureBuilder<ScheduleModel>(
        future: scheduleProvider.getScheduleForTrainer(widget.idTrainer),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ScheduleModel schedule = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Appointment'.toUpperCase(),
                  style: titleStyle,
                ),
                centerTitle: true,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: IconButtonCustom(
                    imageIcon: arrowLeft,
                    fn: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                elevation: 0,
              ),
              bottomNavigationBar: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                child: ButtonCustom(title: 'next', icon: false, fn: () async{
                  Map<String,dynamic> userInfo = await userProvider.getUserInfo('userInfo');
                  appointmentProvider.setAppointment('idClient', userInfo['id']);
                  appointmentProvider.setAppointment('idTrainer', widget.idTrainer);
                  await appointmentProvider.bookAppointment();
                  // ignore: use_build_context_synchronously
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      AppointmentDone(
                          idTrainer: widget.idTrainer,
                          trainerName: widget.trainerName,
                          specializeIn: widget.specializeIn,
                          experience: widget.experience,
                          evaluate: widget.evaluate,
                          avatar: widget.avatar, fn: widget.fn,
                          date: Util().formatTime(initDate),
                          time: schedule.schedulesTime![initTime]),
                  )
                  );
                }),
              ),
              body: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: TrainerCard(
                          trainerName: widget.trainerName,
                          specializeIn: widget.specializeIn,
                          experience: widget.experience,
                          evaluate: widget.evaluate,
                          avatar: widget.avatar,
                          fn: widget.fn),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TableCalendar(
                                onDaySelected: (selectedDay, focusedDay) {
                                  setDate(focusedDay);
                                  appointmentProvider.setAppointment('date',
                                      Util().formatTime(selectedDay));
                                },
                                headerStyle: const HeaderStyle(
                                  formatButtonVisible: false,
                                  titleCentered: true,
                                ),
                                focusedDay: initDate,
                                selectedDayPredicate: (day) => initDate == day,
                                rowHeight: 35,
                                firstDay: DateTime.utc(2023, 11, 01),
                                lastDay: DateTime.utc(2024, 11, 01)),
                            const Divider(
                              color: Colors.white,
                              thickness: 0.5,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                'Time',
                                style: titleStyle,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) => const SizedBox(
                                  width: 15,
                                ),
                                itemBuilder: (context, index) =>
                                    OutlinebuttonCustom(
                                        color: index == initTime
                                            ? yelSchema
                                            : Colors.black,
                                        title: schedule.schedulesTime![index],
                                        fn: () {
                                          appointmentProvider.setAppointment(
                                              'time',
                                              schedule.schedulesTime![index]);
                                          setTime(index);
                                        }),
                                itemCount: schedule.schedulesTime!.length,
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
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
