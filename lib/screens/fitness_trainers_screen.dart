
import 'package:flutter/material.dart';
import 'package:project_app/common_widget/trainer_card.dart';
import 'package:project_app/constant/index.dart';
import 'package:project_app/constant/list_data_start.dart';
import 'package:project_app/screens/detail_trainer_screen.dart';

import '../block/models/trainer_model.dart';

class FitnessTrainerScreen extends StatelessWidget {
  final List<TrainerModel> trainers;
  const FitnessTrainerScreen({super.key, required this.trainers});
  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = Theme.of(context).textTheme.headline2!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'fitness trainers'.toUpperCase(),
          style: titleStyle,
        ),
        leading: IconButton(
          color: Colors.white,
          onPressed: () {},
          icon: ImageIcon(NetworkImage(arrowLeft)),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: TrainerCard(
                  trainerName: trainers[index].name,
                  specializeIn: trainers[index].specializeIn!,
                  experience: trainers[index].experiences!.toString(),
                  evaluate: trainers[index].evaluate!.toString(),
                  avatar: trainers[index].avatar,
                  fn: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailTrainerScreen(trainer: trainers[index],),));
                  },
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: lessons.length),
      ),
    );
  }
}
