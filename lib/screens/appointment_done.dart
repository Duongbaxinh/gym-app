import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/common_widget/button_widget.dart';
import 'package:project_app/common_widget/custome_listTitle.dart';
import 'package:project_app/common_widget/trainer_card.dart';
import 'package:project_app/constant/index.dart';
import 'package:project_app/screens/screen_option.dart';

class AppointmentDone extends StatelessWidget {
  final String idTrainer;
  final String trainerName;
  final String specializeIn;
  final String experience;
  final String evaluate;
  final String avatar;
  final VoidCallback fn;
  final String date;
  final String time;
  const AppointmentDone(
      {super.key,
      required this.idTrainer,
      required this.trainerName,
      required this.specializeIn,
      required this.experience,
      required this.evaluate,
      required this.avatar,
      required this.fn,
      required this.date,
      required this.time});
  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = Theme.of(context).textTheme.headline2!;
    TextStyle subStyle = Theme.of(context).textTheme.headline4!;
    Color greyColor = Theme.of(context).colorScheme.onSecondaryContainer;
    Color bgColor = Theme.of(context).colorScheme.background;
    Color yellSchema = Theme.of(context).colorScheme.onSecondary;
    final s_h = SizedBox(
      height: 10,
    );
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            color: bgColor,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.check_box,
                    color: yellSchema,
                  ),
                  title: Text(
                    'Reserved Completed',
                    style: titleStyle.copyWith(color: yellSchema),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  MESS_BOOK,
                  style: subStyle,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    constraints: const BoxConstraints(minHeight: 300),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: greyColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          child: TrainerCard(
                              trainerName: trainerName,
                              specializeIn: specializeIn,
                              experience: experience,
                              evaluate: evaluate,
                              avatar: avatar,
                              fn: fn),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                height: 1,
                                color: yellSchema,
                              ),
                              s_h,
                              const Text('Date'),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                date,
                                style: titleStyle,
                              ),
                              s_h,
                              Divider(
                                height: 1,
                                color: yellSchema,
                              ),
                              s_h,
                              const Text('Time'),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                time,
                                style: titleStyle,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: ButtonCustom(
                    title: 'Done',
                    icon: false,
                    fn: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScreenOption(),
                          ));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
