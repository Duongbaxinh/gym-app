import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/common_widget/button_widget.dart';
import 'package:project_app/common_widget/custome_listTitle.dart';
import 'package:project_app/common_widget/trainer_card.dart';
import 'package:project_app/constant/index.dart';
import 'package:project_app/screens/home_screen.dart';

class AppointmentDone extends StatelessWidget{
  final String idTrainer;
  final String trainerName;
  final String specializeIn;
  final String experience;
  final String evaluate;
  final String avatar;
  final VoidCallback fn;
  final String date;
  final String time;
  const AppointmentDone({super.key, required this.idTrainer,
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
    Color greyColor =Theme.of(context).colorScheme.onSecondaryContainer;
    Color bgColor =Theme.of(context).colorScheme.background;
    Color yellSchema = Theme.of(context).colorScheme.onSecondary;
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            color: bgColor,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.check_box,color: yellSchema,),
                  title: Text('Reserved Completed',style: titleStyle.copyWith(color: yellSchema),),
                ),
                const SizedBox(height: 25,),
                Text(MESS_BOOK,style: subStyle,),
                const SizedBox(height: 30,),
                Container(
                  constraints: const BoxConstraints(
                    minHeight: 300
                  ),
                  decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                  color: greyColor,
                  ),
                  child:
                 Padding(
                   padding: const EdgeInsets.all(15),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                       Divider(height: 1, color: yellSchema,),
                       const Text('Date'),
                       Text(date,style: titleStyle,),
                       Divider(height: 1,color: yellSchema,),
                       const Text('Time'),
                       Text(time,style: titleStyle,),
                     ],
                   ),
                 )
                  ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 100),
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  height: 60,
                  child: ButtonCustom(title: 'Done',icon:false,fn: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
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