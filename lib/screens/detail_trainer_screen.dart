import 'package:avatar_stack/avatar_stack.dart';
import 'package:flutter/material.dart';
import 'package:project_app/block/models/review_model.dart';
import 'package:project_app/block/models/trainer_model.dart';
import 'package:project_app/block/review_provider.dart';
import 'package:project_app/common_widget/button_widget.dart';
import 'package:project_app/common_widget/custom_chip.dart';
import 'package:project_app/common_widget/form_detail.dart';
import 'package:project_app/constant/index.dart';
import 'package:project_app/screens/appointment_screen.dart';
import 'package:project_app/screens/ratting_screen.dart';
import 'package:project_app/util/caculateRating.dart';
import 'package:project_app/util/show_take_appointment.dart';
import 'package:project_app/widgetGroup/review_layout.dart';
import 'package:provider/provider.dart';

class DetailTrainerScreen extends StatelessWidget {
  final TrainerModel trainer;
  const DetailTrainerScreen({super.key, required this.trainer});
  @override
  Widget build(BuildContext context) {
    Color yelSchema = Theme.of(context).colorScheme.onSecondary;
    TextStyle titleStyle = Theme.of(context).textTheme.headline3!;
    TextStyle subStyle =
        Theme.of(context).textTheme.headline5!.copyWith(color: yelSchema);
    final reviewProvider = Provider.of<ReviewProvider>(context);
    Future<Map<String, dynamic>> getBoth() async {
      print('----------trainer -id ${trainer.id}');
      Map<String, dynamic> dataProvider = {};
      List<ReviewModel> reviews =
          await reviewProvider.getReviewOfTrainer(trainer.id!);
      dataProvider['reviews'] = reviews;
      return dataProvider;
    }

    return FutureBuilder(
      future: getBoth(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ReviewModel> reviewsData = snapshot.data!['reviews'];
          Map<String, dynamic> rattingCalculate =
              calculateNumberRatting(reviewsData);
          Map<String, dynamic> trainerInfo = {
            "Experiences": trainer.experiences,
            "Completed": trainer.completed,
            "Active Client": trainer.activeClients
          };
          return Scaffold(
            body: DetailScreen(
              background: trainer.background!,
              aspect: 375 / 320,
              height: 320,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        trainer.name!,
                        style: titleStyle,
                      ),
                      subtitle: Text(
                        // update
                        trainer.specializeIn ?? '',
                        style: subStyle,
                      ),
                      trailing: CircleAvatar(
                        backgroundColor: yelSchema,
                        radius: 35,
                        child: ImageIcon(
                          NetworkImage(PHONE_ICON),
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSurface,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: GridView(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(0),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, crossAxisSpacing: 5),
                          children: <Widget>[
                            for (var key in trainerInfo.keys)
                              Center(
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      border: (key == 'Completed')
                                          ? Border.symmetric(
                                              vertical:
                                                  BorderSide(color: yelSchema))
                                          : null),
                                  child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                          text: trainerInfo[key].toString(),
                                          style: titleStyle,
                                          children: [
                                            TextSpan(
                                                text: '\n$key',
                                                style: subStyle.copyWith(
                                                    height: 2,
                                                    fontWeight:
                                                        FontWeight.normal))
                                          ])),
                                ),
                              )
                          ],
                        )),
                    ListTile(
                      leading: Text('Review', style: titleStyle),
                      trailing: ChipCustom(
                        label: rattingCalculate['mean'].toStringAsFixed(1),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                          leading: AvatarStack(
                            width: 150,
                            borderColor: Colors.transparent,
                            avatars: [
                              for (int i = 0; i < reviewsData.length; i++)
                                NetworkImage(reviewsData[i].avatar! ?? '')
                            ],
                          ),
                          trailing: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RattingScreen(
                                        rattingCalculate: rattingCalculate,
                                        idTrainer: trainer.id!,
                                        reviewsList: reviewsData),
                                  ));
                            },
                            child: Text(
                              'Read all reviews',
                              style: subStyle.copyWith(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            ),
                          )),
                    ),
                    ReviewLayOut(
                        idTrainer: trainer.id!,
                        scrollDirection: Axis.horizontal,
                        height: 150),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              height: 60,
              child: ButtonCustom(
                title: 'Book An Appointment',
                fn: () {
                  ShowAppointment(
                      trainer.background, trainer.name, trainer.specializeIn!,
                      () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppointmentScreen(
                              idTrainer: trainer.id!,
                              trainerName: trainer.name,
                              specializeIn: trainer.specializeIn!,
                              experience: trainer.experiences.toString(),
                              evaluate: trainer.evaluate!.toStringAsFixed(1),
                              avatar: trainer.avatar,
                              fn: () {}),
                        ));
                  }, context);
                },
                icon: false,
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
