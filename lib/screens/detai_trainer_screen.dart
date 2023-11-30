import 'package:avatar_stack/avatar_stack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/block/models/trainer_model.dart';
import 'package:project_app/block/trainer_provider.dart';
import 'package:project_app/common_widget/button_widget.dart';
import 'package:project_app/common_widget/card_review.dart';
import 'package:project_app/common_widget/custom_chip.dart';
import 'package:project_app/common_widget/form_detail.dart';
import 'package:project_app/constant/index.dart';
import 'package:project_app/constant/list_data_start.dart';
import 'package:provider/provider.dart';

class DetailTrainerScreen extends StatelessWidget {
  const DetailTrainerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Color yelSchema = Theme.of(context).colorScheme.onSecondary;
    TextStyle titleStyle = Theme.of(context).textTheme.headline3!;
    TextStyle subStyle =
        Theme.of(context).textTheme.headline5!.copyWith(color: yelSchema);
    return Consumer<TrainerProvider>(
        builder: (context, trainerProvide, child) =>
            FutureBuilder<TrainerModel>(
              future: trainerProvide.getDetail('1'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  TrainerModel trainer = snapshot.data!;
                  Map<String, dynamic> trainerInfo = {
                    "Experiences": trainer.experiences,
                    "Completed": trainer.completed,
                    "Active Client": trainer.activeClients
                  };
                  return DetailScreen(
                    background: trainer.background,
                    aspect: 375 / 249,
                    height: 220,
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              trainer.name,
                              style: titleStyle,
                            ),
                            subtitle: Text(
                              trainer.specializedIn,
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
                            margin:EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: GridView(
                                physics: NeverScrollableScrollPhysics(),
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
                                                    vertical: BorderSide(
                                                        color: yelSchema))
                                                : null),
                                        child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                                text:
                                                    trainerInfo[key].toString(),
                                                style: titleStyle,
                                                children: [
                                                  TextSpan(
                                                      text: '\n$key',
                                                      style: subStyle.copyWith(
                                                          height: 2,
                                                          fontWeight: FontWeight
                                                              .normal))
                                                ])),
                                      ),
                                    )
                                ],
                              )),
                          ListTile(
                            leading: Text('Review', style: titleStyle),
                            trailing: ChipCustom(
                              label: trainer.evaluate.toString(),
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
                                  for (int i = 0; i < lessons.length; i++)
                                    NetworkImage(lessons[i]!['trainer']['avatar'])
                                ],
                              ),
                              trailing: Text(
                                'Read all reviews',
                                style: subStyle.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => CardReview(
                                    avatar:
                                        review[index]!['client']!['avatar']!,
                                    name: review[index]!['client']!['name']!,
                                    evaluate:
                                        review[index]!['client']!['evaluate']!
                                            .toString(),
                                    comment: review[index]!['comment']!),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      width: 15,
                                    ),
                                itemCount: review.length),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            height: 80,
                            child: ButtonCustom(
                              title: 'Book An Appointment',
                              fn: () {},
                              icon: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // footer: Align(
                    //   alignment: Alignment.bottomCenter,
                    //   child:
                    //   Container(
                    //     margin: const EdgeInsets.only(bottom: 20),
                    //     height: 80,
                    //     child: ButtonCustom(
                    //       title: 'Book An Appointment',
                    //       fn: () {},
                    //       icon: false,
                    //     ),
                    //   ),
                    // ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ));
  }
}
