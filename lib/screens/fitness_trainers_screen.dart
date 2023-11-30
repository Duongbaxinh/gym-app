import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/common_widget/trainer_card.dart';
import 'package:project_app/constant/index.dart';
import 'package:project_app/constant/list_data_start.dart';

class FitnessTrainerScreen extends StatelessWidget{
  const FitnessTrainerScreen({super.key});


  @override
  Widget build(BuildContext context){
    TextStyle titleStyle = Theme.of(context).textTheme.headline2!;
    return Scaffold(
      appBar: AppBar(
        title: Text('fitness trainers'.toUpperCase(),style: titleStyle,),
        leading: IconButton(
          color: Colors.white,
          onPressed: (){},
          icon:ImageIcon(NetworkImage(arrowLeft)),),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: ListView.separated(
            itemBuilder: (context, index){
              Map<String,dynamic> trainer = lessons[index]['trainer'];
              return  ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: TrainerCard(
                    trainerName: trainer['name'],
                specializeIn:  trainer['specializedIn'],
                experience:  trainer['experiences'],
                    evaluate:  trainer['evaluate'],
                    avatar: trainer['avatar'],
                    fn:(){},
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 10,),
            itemCount: lessons.length),
      ),
    );
  }
}